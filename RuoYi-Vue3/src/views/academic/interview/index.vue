<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="访谈标题" prop="title">
        <el-input
          v-model="queryParams.title"
          placeholder="请输入访谈标题"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="受访者姓名" prop="interviewee">
        <el-input
          v-model="queryParams.interviewee"
          placeholder="请输入受访者姓名"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="受访者简介" prop="shortBio">
        <el-input
          v-model="queryParams.shortBio"
          placeholder="请输入受访者简介"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="访谈日期" prop="interviewDate">
        <el-date-picker clearable
          v-model="queryParams.interviewDate"
          type="date"
          value-format="YYYY-MM-DD"
          placeholder="请选择访谈日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="是否推荐" prop="featured">
        <el-input
          v-model="queryParams.featured"
          placeholder="请输入是否推荐"
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
      <el-form-item label="显示顺序" prop="displayOrder">
        <el-input
          v-model="queryParams.displayOrder"
          placeholder="请输入显示顺序"
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
          v-hasPermi="['academic:interview:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['academic:interview:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['academic:interview:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['academic:interview:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="interviewList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="id" />
      <el-table-column label="访谈标题" align="center" prop="title" />
      <el-table-column label="受访者姓名" align="center" prop="interviewee" />
      <el-table-column label="受访者头像" align="center" prop="avatarUrl" />
      <el-table-column label="受访者简介" align="center" prop="shortBio" />
      <el-table-column label="访谈日期" align="center" prop="interviewDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.interviewDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="访谈内容" align="center" prop="content" />
      <el-table-column label="是否推荐" align="center" prop="featured" />
      <el-table-column label="浏览次数" align="center" prop="viewCount" />
      <el-table-column label="显示顺序" align="center" prop="displayOrder" />
      <el-table-column label="访谈状态" align="center" prop="status" />
      <el-table-column label="更新时间" align="center" prop="updatedAt" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.updatedAt, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['academic:interview:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['academic:interview:remove']">删除</el-button>
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

    <!-- 添加或修改访谈，管理学者、传承人等访谈内容对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="interviewRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="访谈标题" prop="title">
          <el-input v-model="form.title" placeholder="请输入访谈标题" />
        </el-form-item>
        <el-form-item label="受访者姓名" prop="interviewee">
          <el-input v-model="form.interviewee" placeholder="请输入受访者姓名" />
        </el-form-item>
        <el-form-item label="受访者头像" prop="avatarUrl">
          <el-input v-model="form.avatarUrl" placeholder="请输入受访者头像" />
        </el-form-item>
        <el-form-item label="受访者简介" prop="shortBio">
          <el-input v-model="form.shortBio" placeholder="请输入受访者简介" />
        </el-form-item>
        <el-form-item label="访谈日期" prop="interviewDate">
          <el-date-picker clearable
            v-model="form.interviewDate"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择访谈日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="访谈内容">
          <editor v-model="form.content" :min-height="192"/>
        </el-form-item>
        <el-form-item label="是否推荐" prop="featured">
          <el-input v-model="form.featured" placeholder="请输入是否推荐" />
        </el-form-item>
        <el-form-item label="浏览次数" prop="viewCount">
          <el-input v-model="form.viewCount" placeholder="请输入浏览次数" />
        </el-form-item>
        <el-form-item label="显示顺序" prop="displayOrder">
          <el-input v-model="form.displayOrder" placeholder="请输入显示顺序" />
        </el-form-item>
        <el-form-item label="创建人ID" prop="createdBy">
          <el-input v-model="form.createdBy" placeholder="请输入创建人ID" />
        </el-form-item>
        <el-form-item label="更新人ID" prop="updatedBy">
          <el-input v-model="form.updatedBy" placeholder="请输入更新人ID" />
        </el-form-item>
        <el-form-item label="逻辑删除标志" prop="delFlag">
          <el-input v-model="form.delFlag" placeholder="请输入逻辑删除标志" />
        </el-form-item>
        <el-form-item label="删除人ID" prop="deletedBy">
          <el-input v-model="form.deletedBy" placeholder="请输入删除人ID" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注" />
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

<script setup name="Interview">
import { listInterview, getInterview, delInterview, addInterview, updateInterview } from "@/api/academic/interview"

const { proxy } = getCurrentInstance()

const interviewList = ref([])
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
    interviewee: null,
    shortBio: null,
    interviewDate: null,
    featured: null,
    viewCount: null,
    displayOrder: null,
    status: null,
  },
  rules: {
    title: [
      { required: true, message: "访谈标题不能为空", trigger: "blur" }
    ],
    interviewee: [
      { required: true, message: "受访者姓名不能为空", trigger: "blur" }
    ],
    shortBio: [
      { required: true, message: "受访者简介不能为空", trigger: "blur" }
    ],
    content: [
      { required: true, message: "访谈内容不能为空", trigger: "blur" }
    ],
    createdAt: [
      { required: true, message: "创建时间不能为空", trigger: "blur" }
    ],
  }
})

const { queryParams, form, rules } = toRefs(data)

/** 查询访谈，管理学者、传承人等访谈内容列表 */
function getList() {
  loading.value = true
  listInterview(queryParams.value).then(response => {
    interviewList.value = response.rows
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
    interviewee: null,
    avatarUrl: null,
    shortBio: null,
    interviewDate: null,
    content: null,
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
  proxy.resetForm("interviewRef")
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
  title.value = "添加访谈，管理学者、传承人等访谈内容"
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset()
  const _id = row.id || ids.value
  getInterview(_id).then(response => {
    form.value = response.data
    open.value = true
    title.value = "修改访谈，管理学者、传承人等访谈内容"
  })
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["interviewRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateInterview(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功")
          open.value = false
          getList()
        })
      } else {
        addInterview(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除访谈，管理学者、传承人等访谈内容编号为"' + _ids + '"的数据项？').then(function() {
    return delInterview(_ids)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("删除成功")
  }).catch(() => {})
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('academic/interview/export', {
    ...queryParams.value
  }, `interview_${new Date().getTime()}.xlsx`)
}

getList()
</script>
