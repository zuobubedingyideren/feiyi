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
      <el-form-item label="名录类别" prop="unescoCategory">
        <el-input
          v-model="queryParams.unescoCategory"
          placeholder="请输入名录类别"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="入选年份" prop="unescoYear">
        <el-input
          v-model="queryParams.unescoYear"
          placeholder="请输入入选年份"
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
          v-hasPermi="['catalog:heritage:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['catalog:heritage:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['catalog:heritage:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['catalog:heritage:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="heritageList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="名录ID" align="center" prop="id" />
      <el-table-column label="项目ID" align="center" prop="projectId" />
      <el-table-column label="名录类别" align="center" prop="unescoCategory" />
      <el-table-column label="名录类型" align="center" prop="unescoListType" />
      <el-table-column label="入选年份" align="center" prop="unescoYear" />
      <el-table-column label="状态" align="center" prop="status" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['catalog:heritage:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['catalog:heritage:remove']">删除</el-button>
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

    <!-- 添加或修改UNESCO非遗名录，管理联合国教科文组织非遗名录信息对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="heritageRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="项目ID" prop="projectId">
          <el-input v-model="form.projectId" placeholder="请输入项目ID" />
        </el-form-item>
        <el-form-item label="名录类别" prop="unescoCategory">
          <el-input v-model="form.unescoCategory" placeholder="请输入名录类别" />
        </el-form-item>
        <el-form-item label="入选年份" prop="unescoYear">
          <el-input v-model="form.unescoYear" placeholder="请输入入选年份" />
        </el-form-item>
        <el-form-item label="名录描述" prop="unescoDescription">
          <el-input v-model="form.unescoDescription" type="textarea" placeholder="请输入内容" />
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
        <el-form-item label="创建时间" prop="createdAt">
          <el-date-picker clearable
            v-model="form.createdAt"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择创建时间">
          </el-date-picker>
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
        <el-form-item label="删除时间" prop="deletedAt">
          <el-date-picker clearable
            v-model="form.deletedAt"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择删除时间">
          </el-date-picker>
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

<script setup name="Heritage">
import { listHeritage, getHeritage, delHeritage, addHeritage, updateHeritage } from "@/api/catalog/heritage"

const { proxy } = getCurrentInstance()

const heritageList = ref([])
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
    unescoCategory: null,
    unescoListType: null,
    unescoYear: null,
    status: null,
  },
  rules: {
    projectId: [
      { required: true, message: "项目ID不能为空", trigger: "blur" }
    ],
    unescoCategory: [
      { required: true, message: "名录类别不能为空", trigger: "blur" }
    ],
    unescoListType: [
      { required: true, message: "名录类型不能为空", trigger: "change" }
    ],
    unescoYear: [
      { required: true, message: "入选年份不能为空", trigger: "blur" }
    ],
    unescoDescription: [
      { required: true, message: "名录描述不能为空", trigger: "blur" }
    ],
    status: [
      { required: true, message: "状态不能为空", trigger: "change" }
    ],
  }
})

const { queryParams, form, rules } = toRefs(data)

/** 查询UNESCO非遗名录，管理联合国教科文组织非遗名录信息列表 */
function getList() {
  loading.value = true
  listHeritage(queryParams.value).then(response => {
    heritageList.value = response.rows
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
    unescoCategory: null,
    unescoListType: null,
    unescoYear: null,
    unescoDescription: null,
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
  proxy.resetForm("heritageRef")
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
  title.value = "添加UNESCO非遗名录，管理联合国教科文组织非遗名录信息"
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset()
  const _id = row.id || ids.value
  getHeritage(_id).then(response => {
    form.value = response.data
    open.value = true
    title.value = "修改UNESCO非遗名录，管理联合国教科文组织非遗名录信息"
  })
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["heritageRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateHeritage(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功")
          open.value = false
          getList()
        })
      } else {
        addHeritage(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除UNESCO非遗名录，管理联合国教科文组织非遗名录信息编号为"' + _ids + '"的数据项？').then(function() {
    return delHeritage(_ids)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("删除成功")
  }).catch(() => {})
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('catalog/heritage/export', {
    ...queryParams.value
  }, `heritage_${new Date().getTime()}.xlsx`)
}

getList()
</script>
