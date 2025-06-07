<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="文章标题" prop="title">
        <el-input
            v-model="queryParams.title"
            placeholder="请输入文章标题"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="作者" prop="author">
        <el-input
            v-model="queryParams.author"
            placeholder="请输入作者"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="发表日期" prop="publishDate">
        <el-date-picker clearable
                        v-model="queryParams.publishDate"
                        type="date"
                        value-format="YYYY-MM-DD"
                        placeholder="请选择发表日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="文章来源" prop="source">
        <el-input
            v-model="queryParams.source"
            placeholder="请输入文章来源"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="浏览次数" prop="viewCount">
        <el-input
            v-model="queryParams.viewCount"
            placeholder="请输入浏览次数"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文章状态" prop="status">
        <el-input
            v-model="queryParams.status"
            placeholder="请输入文章状态"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>
    
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
            type="primary"
            plain
            icon="Plus"
            @click="handleAdd"
            v-hasPermi="['academic:article:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="success"
            plain
            icon="Edit"
            :disabled="single"
            @click="handleUpdate"
            v-hasPermi="['academic:article:edit']"
        >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="danger"
            plain
            icon="Delete"
            :disabled="multiple"
            @click="handleDelete"
            v-hasPermi="['academic:article:remove']"
        >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="warning"
            plain
            icon="Download"
            @click="handleExport"
            v-hasPermi="['academic:article:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>
    
    <el-table v-loading="loading" :data="articleList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="id" align="center" prop="id" min-width="60"/>
      <el-table-column label="文章标题" align="center" prop="title"/>
      <el-table-column label="作者" align="center" prop="author"/>
      <el-table-column label="发表日期" align="center" prop="publishDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.publishDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="文章来源" align="center" prop="source"/>
      <el-table-column label="文章内容" align="center" prop="content">
        <template #default="scope">
          <el-tooltip
              effect="light"
              :content="scope.row.content"
              placement="top"
              :disabled="!scope.row.content || scope.row.content.length <= 25"
              :show-after="300"
              :hide-after="100"
              popper-class="custom-tooltip"
              raw-content
          >
            <span class="content-cell">
              {{
                scope.row.content && scope.row.content.length > 25
                    ? scope.row.content.substring(0, 25) + '...'
                    : scope.row.content
              }}
            </span>
          </el-tooltip>
        </template>
      </el-table-column>
      <el-table-column label="文章状态" align="center" prop="status">
        <template #default="scope">
          <dict-tag :options="sys_status" :value="scope.row.status" />
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)"
                     v-hasPermi="['academic:article:edit']">修改
          </el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)"
                     v-hasPermi="['academic:article:remove']">删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
        v-show="total>0"
        :total="total"
        v-model:page="queryParams.pageNum"
        v-model:limit="queryParams.pageSize"
        @pagination="getList"
    />
    
    <!-- 添加或修改学术文章，管理学术研究类文章信息对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="articleRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="文章标题" prop="title">
          <el-input v-model="form.title" placeholder="请输入文章标题"/>
        </el-form-item>
        <el-form-item label="作者" prop="author">
          <el-input v-model="form.author" placeholder="请输入作者"/>
        </el-form-item>
        <el-form-item label="发表日期" prop="publishDate">
          <el-date-picker clearable
                          v-model="form.publishDate"
                          type="date"
                          value-format="YYYY-MM-DD"
                          placeholder="请选择发表日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="文章来源" prop="source">
          <el-input v-model="form.source" placeholder="请输入文章来源"/>
        </el-form-item>
        <el-form-item label="文章内容">
          <editor v-model="form.content" :min-height="192"/>
        </el-form-item>
        <el-form-item label="浏览次数" prop="viewCount">
          <el-input v-model="form.viewCount" placeholder="请输入浏览次数"/>
        </el-form-item>
        <el-form-item label="显示顺序" prop="displayOrder">
          <el-input v-model="form.displayOrder" placeholder="请输入显示顺序"/>
        </el-form-item>
        <el-form-item label="更新人ID" prop="updatedBy">
          <el-input v-model="form.updatedBy" placeholder="请输入更新人ID"/>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注"/>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Article">
import {addArticle, delArticle, getArticle, listArticle, updateArticle} from "@/api/academic/article"

const { proxy } = getCurrentInstance()
const { sys_status } = proxy.useDict("sys_status")

const articleList = ref([])
const open = ref(false)
const loading = ref(true)
const showSearch = ref(true)
const ids = ref([])
const single = ref(true)
const multiple = ref(true)
const total = ref(0)
const title = ref("")

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    title: null,
    author: null,
    publishDate: null,
    source: null,
    content: null,
    viewCount: null,
    displayOrder: null,
    status: null,
  },
  rules: {
    title: [
      {required: true, message: "文章标题不能为空", trigger: "blur"}
    ],
    author: [
      {required: true, message: "作者不能为空", trigger: "blur"}
    ],
    publishDate: [
      {required: true, message: "发表日期不能为空", trigger: "blur"}
    ],
    source: [
      {required: true, message: "文章来源不能为空", trigger: "blur"}
    ],
    content: [
      {required: true, message: "文章内容不能为空", trigger: "blur"}
    ],
    status: [
      {required: true, message: "文章状态不能为空", trigger: "change"}
    ],
  }
})

const {queryParams, form, rules} = toRefs(data)

/** 查询学术文章，管理学术研究类文章信息列表 */
function getList() {
  loading.value = true
  listArticle(queryParams.value).then(response => {
    articleList.value = response.rows
    total.value = response.total
    loading.value = false
  })
}

// 取消按钮
function cancel() {
  open.value = false
  reset()
}

// 表单重置
function reset() {
  form.value = {
    id: null,
    title: null,
    author: null,
    publishDate: null,
    source: null,
    content: null,
    category: null,
    featured: null,
    viewCount: null,
    displayOrder: null,
    status: null,
    createdAt: null,
    updatedAt: null,
    createdBy: null,
    updatedBy: null,
    delFlag: null,
    deletedAt: null,
    deletedBy: null,
    remark: null
  }
  proxy.resetForm("articleRef")
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1
  getList()
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef")
  handleQuery()
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.id)
  single.value = selection.length != 1
  multiple.value = !selection.length
}

/** 新增按钮操作 */
function handleAdd() {
  reset()
  open.value = true
  title.value = "添加学术文章，管理学术研究类文章信息"
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset()
  const _id = row.id || ids.value
  getArticle(_id).then(response => {
    form.value = response.data
    open.value = true
    title.value = "修改学术文章，管理学术研究类文章信息"
  })
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["articleRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateArticle(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功")
          open.value = false
          getList()
        })
      } else {
        addArticle(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功")
          open.value = false
          getList()
        })
      }
    }
  })
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _ids = row.id || ids.value
  proxy.$modal.confirm('是否确认删除学术文章，管理学术研究类文章信息编号为"' + _ids + '"的数据项？').then(function () {
    return delArticle(_ids)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("删除成功")
  }).catch(() => {
  })
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('academic/article/export', {
    ...queryParams.value
  }, `article_${new Date().getTime()}.xlsx`)
}

getList()
</script>

<style scoped>
.content-cell:hover {
  text-decoration: underline;
  color: #409eff;
}
</style>

<style>
.custom-tooltip {
  max-width: 400px !important;
  white-space: pre-wrap !important;
  word-wrap: break-word !important;
  line-height: 1.5 !important;
  padding: 12px 16px !important;
  border-radius: 8px !important;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15) !important;
  font-size: 14px !important;
  background: #ffffff !important;
  border: 1px solid #e4e7ed !important;
  color: #606266 !important;
}

.custom-tooltip .el-popper__arrow::before {
  background: #ffffff !important;
  border: 1px solid #e4e7ed !important;
}
</style>
