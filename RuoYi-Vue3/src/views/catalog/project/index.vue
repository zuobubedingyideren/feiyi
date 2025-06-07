<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="项目名称" prop="projectName">
        <el-input
          v-model="queryParams.projectName"
          placeholder="请输入项目名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="遗产类别" prop="heritageCategoryName">
        <el-input
          v-model="queryParams.heritageCategoryName"
          placeholder="请输入遗产类别"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="项目序号" prop="serialNumber">
        <el-input
          v-model="queryParams.serialNumber"
          placeholder="请输入项目序号"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="申报地区" prop="declarationArea">
        <el-input
          v-model="queryParams.declarationArea"
          placeholder="请输入申报地区"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="父项目ID" prop="parentProjectId">
        <el-input
          v-model="queryParams.parentProjectId"
          placeholder="请输入父项目ID"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="子项目" prop="hasSubProjects">
        <el-input
          v-model="queryParams.hasSubProjects"
          placeholder="请输入子项目"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="批次号" prop="batchNumber">
        <el-input
          v-model="queryParams.batchNumber"
          placeholder="请输入批次号"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="联合国教科文组织名录ID" prop="unescoId" style="white-space: nowrap; margin-left: 25px;font-size:12px;">
        <el-input
          v-model="queryParams.unescoId"
          placeholder="请输入联合国教科文组织名录ID"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="保护单位" prop="protectionUnit">
        <el-input
          v-model="queryParams.protectionUnit"
          placeholder="请输入保护单位"
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
          v-hasPermi="['catalog:project:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['catalog:project:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['catalog:project:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['catalog:project:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="projectList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="项目ID" align="center" prop="id" />
      <el-table-column label="项目名称" align="center" prop="projectName" />
      <el-table-column label="遗产类别" align="center" prop="heritageCategoryName" />
      <el-table-column label="项目序号" align="center" prop="serialNumber" />
      <el-table-column label="申报地区" align="center" prop="declarationArea" />
      <el-table-column label="批次号" align="center" prop="batchNumber" />
      <el-table-column label="封面图片" align="center" prop="coverImage" width="100">
        <template #default="scope">
          <image-preview :src="scope.row.coverImage" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="项目重要里程碑" align="center" prop="milestoneEvents" />
      <el-table-column label="项目介绍" align="center" prop="projectDescription" />
      <el-table-column label="遗产类型" align="center" prop="projectType" />
      <el-table-column label="保护单位" align="center" prop="protectionUnit" />
      <el-table-column label="发布时间" align="center" prop="publishTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.publishTime, '{y}-{m}-{d}') }}</span>
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
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['catalog:project:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['catalog:project:remove']">删除</el-button>
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

    <!-- 添加或修改非遗项目，管理非遗项目信息对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="projectRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="项目名称" prop="projectName">
          <el-input v-model="form.projectName" placeholder="请输入项目名称" />
        </el-form-item>
        <el-form-item label="遗产类别" prop="heritageCategoryName">
          <el-input v-model="form.heritageCategoryName" placeholder="请输入遗产类别" />
        </el-form-item>
        <el-form-item label="项目序号" prop="serialNumber">
          <el-input v-model="form.serialNumber" placeholder="请输入项目序号" />
        </el-form-item>
        <el-form-item label="申报地区" prop="declarationArea">
          <el-input v-model="form.declarationArea" placeholder="请输入申报地区" />
        </el-form-item>
        <el-form-item label="申报级别" prop="declarationLevel">
          <el-input v-model="form.declarationLevel" placeholder="请输入申报级别" />
        </el-form-item>
        <el-form-item label="项目层级" prop="projectLevel">
          <el-input v-model="form.projectLevel" placeholder="请输入项目层级" />
        </el-form-item>
        <el-form-item label="父项目ID" prop="parentProjectId">
          <el-input v-model="form.parentProjectId" placeholder="请输入父项目ID" />
        </el-form-item>
        <el-form-item label="子项目" prop="hasSubProjects">
          <el-input v-model="form.hasSubProjects" placeholder="请输入子项目" />
        </el-form-item>
        <el-form-item label="批次号" prop="batchNumber">
          <el-input v-model="form.batchNumber" placeholder="请输入批次号" />
        </el-form-item>
        <el-form-item label="联合国教科文组织名录ID" prop="unescoId">
          <el-input v-model="form.unescoId" placeholder="请输入联合国教科文组织名录ID" />
        </el-form-item>
        <el-form-item label="封面图片" prop="coverImage">
          <image-upload v-model="form.coverImage"/>
        </el-form-item>
        <el-form-item label="项目重要里程碑" prop="milestoneEvents">
          <el-input v-model="form.milestoneEvents" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="项目介绍" prop="projectDescription">
          <el-input v-model="form.projectDescription" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="保护单位" prop="protectionUnit">
          <el-input v-model="form.protectionUnit" placeholder="请输入保护单位" />
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
        <el-form-item label="浏览次数" prop="viewCount">
          <el-input v-model="form.viewCount" placeholder="请输入浏览次数" />
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

<script setup name="Project">
import { listProject, getProject, delProject, addProject, updateProject } from "@/api/catalog/project"

const { proxy } = getCurrentInstance()

const projectList = ref([])
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
    projectName: null,
    heritageCategoryName: null,
    serialNumber: null,
    declarationArea: null,
    parentProjectId: null,
    hasSubProjects: null,
    batchNumber: null,
    unescoId: null,
    projectDescription: null,
    projectType: null,
    protectionUnit: null,
    status: null,
  },
  rules: {
    projectName: [
      { required: true, message: "项目名称不能为空", trigger: "blur" }
    ],
    createdAt: [
      { required: true, message: "创建时间不能为空", trigger: "blur" }
    ],
  }
})

const { queryParams, form, rules } = toRefs(data)

/** 查询非遗项目，管理非遗项目信息列表 */
function getList() {
  loading.value = true
  listProject(queryParams.value).then(response => {
    projectList.value = response.rows
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
    projectName: null,
    heritageCategoryName: null,
    serialNumber: null,
    declarationArea: null,
    declarationLevel: null,
    projectLevel: null,
    parentProjectId: null,
    hasSubProjects: null,
    batchNumber: null,
    unescoId: null,
    coverImage: null,
    milestoneEvents: null,
    projectDescription: null,
    projectType: null,
    protectionUnit: null,
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
  proxy.resetForm("projectRef")
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
  title.value = "添加非遗项目，管理非遗项目信息"
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset()
  const _id = row.id || ids.value
  getProject(_id).then(response => {
    form.value = response.data
    open.value = true
    title.value = "修改非遗项目，管理非遗项目信息"
  })
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["projectRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateProject(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功")
          open.value = false
          getList()
        })
      } else {
        addProject(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除非遗项目，管理非遗项目信息编号为"' + _ids + '"的数据项？').then(function() {
    return delProject(_ids)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("删除成功")
  }).catch(() => {})
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('catalog/project/export', {
    ...queryParams.value
  }, `project_${new Date().getTime()}.xlsx`)
}

getList()
</script>
