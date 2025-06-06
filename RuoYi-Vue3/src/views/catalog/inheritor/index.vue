<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="项目ID" prop="projectId">
        <el-input
          v-model="queryParams.projectId"
          placeholder="请输入项目ID"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="传承人姓名" prop="inheritorName">
        <el-input
          v-model="queryParams.inheritorName"
          placeholder="请输入传承人姓名"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="性别" prop="gender">
        <el-input
          v-model="queryParams.gender"
          placeholder="请输入性别"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="民族" prop="nation">
        <el-input
          v-model="queryParams.nation"
          placeholder="请输入民族"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="传承人级别" prop="inheritorLevel">
        <el-input
          v-model="queryParams.inheritorLevel"
          placeholder="请输入传承人级别"
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
          v-hasPermi="['catalog:inheritor:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['catalog:inheritor:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['catalog:inheritor:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['catalog:inheritor:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="inheritorList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="传承人ID" align="center" prop="id" />
      <el-table-column label="项目ID" align="center" prop="projectId" />
      <el-table-column label="传承人姓名" align="center" prop="inheritorName" />
      <el-table-column label="性别" align="center" prop="gender">
        <template #default="scope">
          <dict-tag :options="sys_user_sex" :value="scope.row.gender"/>
        </template>
      </el-table-column>
      <el-table-column label="民族" align="center" prop="nation" />
      <el-table-column label="传承人头像" align="center" prop="avatarUrl" />
      <el-table-column label="传承人级别" align="center" prop="inheritorLevel" />
      <el-table-column label="传承人详细信息描述" align="center" prop="inheritorInfo" />
      <el-table-column label="公布日期" align="center" prop="announceDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.announceDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="状态" align="center" prop="status" />
      <el-table-column label="更新时间" align="center" prop="updatedAt" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.updatedAt, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['catalog:inheritor:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['catalog:inheritor:remove']">删除</el-button>
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

    <!-- 添加或修改非遗传承人对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="inheritorRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="项目ID" prop="projectId">
          <el-input v-model="form.projectId" placeholder="请输入项目ID" />
        </el-form-item>
        <el-form-item label="传承人姓名" prop="inheritorName">
          <el-input v-model="form.inheritorName" placeholder="请输入传承人姓名" />
        </el-form-item>
        <el-form-item label="性别" prop="gender">
          <el-input v-model="form.gender" placeholder="请输入性别" />
        </el-form-item>
        <el-form-item label="民族" prop="nation">
          <el-input v-model="form.nation" placeholder="请输入民族" />
        </el-form-item>
        <el-form-item label="传承人头像" prop="avatarUrl">
          <el-input v-model="form.avatarUrl" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="传承人级别" prop="inheritorLevel">
          <el-input v-model="form.inheritorLevel" placeholder="请输入传承人级别" />
        </el-form-item>
        <el-form-item label="传承人详细信息描述" prop="inheritorInfo">
          <el-input v-model="form.inheritorInfo" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="公布日期" prop="announceDate">
          <el-date-picker clearable
            v-model="form.announceDate"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择公布日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="发布时间" prop="publishTime">
          <el-date-picker clearable
            v-model="form.publishTime"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择发布时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="文章来源" prop="articleSource">
          <el-input v-model="form.articleSource" placeholder="请输入文章来源" />
        </el-form-item>
        <el-form-item label="浏览量" prop="viewCount">
          <el-input v-model="form.viewCount" placeholder="请输入浏览量" />
        </el-form-item>
        <el-form-item label="更新时间" prop="updatedAt">
          <el-date-picker clearable
            v-model="form.updatedAt"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择更新时间">
          </el-date-picker>
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

<script setup name="Inheritor">
import { listInheritor, getInheritor, delInheritor, addInheritor, updateInheritor } from "@/api/catalog/inheritor"

const { proxy } = getCurrentInstance()

const inheritorList = ref([])
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
    projectId: null,
    inheritorName: null,
    gender: null,
    nation: null,
    inheritorLevel: null,
    status: null,
  },
  rules: {
    inheritorName: [
      { required: true, message: "传承人姓名不能为空", trigger: "blur" }
    ],
    gender: [
      { required: true, message: "性别不能为空", trigger: "blur" }
    ],
    nation: [
      { required: true, message: "民族不能为空", trigger: "blur" }
    ],
    avatarUrl: [
      { required: true, message: "传承人头像不能为空", trigger: "blur" }
    ],
    inheritorLevel: [
      { required: true, message: "传承人级别不能为空", trigger: "blur" }
    ],
    inheritorInfo: [
      { required: true, message: "传承人详细信息描述不能为空", trigger: "blur" }
    ],
    announceDate: [
      { required: true, message: "公布日期不能为空", trigger: "blur" }
    ],
    createdAt: [
      { required: true, message: "创建时间不能为空", trigger: "blur" }
    ],
  }
})

const { queryParams, form, rules } = toRefs(data)

/** 查询非遗传承人列表 */
function getList() {
  loading.value = true
  listInheritor(queryParams.value).then(response => {
    inheritorList.value = response.rows
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
    projectId: null,
    inheritorName: null,
    gender: null,
    nation: null,
    avatarUrl: null,
    inheritorLevel: null,
    inheritorInfo: null,
    announceDate: null,
    publishTime: null,
    articleSource: null,
    viewCount: null,
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
  proxy.resetForm("inheritorRef")
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
  title.value = "添加非遗传承人"
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset()
  const _id = row.id || ids.value
  getInheritor(_id).then(response => {
    form.value = response.data
    open.value = true
    title.value = "修改非遗传承人"
  })
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["inheritorRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateInheritor(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功")
          open.value = false
          getList()
        })
      } else {
        addInheritor(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除非遗传承人编号为"' + _ids + '"的数据项？').then(function() {
    return delInheritor(_ids)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("删除成功")
  }).catch(() => {})
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('catalog/inheritor/export', {
    ...queryParams.value
  }, `inheritor_${new Date().getTime()}.xlsx`)
}

getList()
</script>
