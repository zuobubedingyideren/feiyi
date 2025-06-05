<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="所属影集ID" prop="albumId">
        <el-input
          v-model="queryParams.albumId"
          placeholder="请输入所属影集ID"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="照片标题" prop="photoTitle">
        <el-input
          v-model="queryParams.photoTitle"
          placeholder="请输入照片标题"
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
          v-hasPermi="['resource:photo:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['resource:photo:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['resource:photo:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['resource:photo:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="photoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="图片id" align="center" prop="id" />
      <el-table-column label="所属影集ID" align="center" prop="albumId" />
      <el-table-column label="照片标题" align="center" prop="photoTitle" />
      <el-table-column label="照片URL" align="center" prop="photoUrl" />
      <el-table-column label="照片描述" align="center" prop="photoDesc" />
      <el-table-column label="水印图片URL" align="center" prop="watermarkUrl" />
      <el-table-column label="水印位置" align="center" prop="watermarkPosition" />
      <el-table-column label="水印透明度" align="center" prop="watermarkOpacity" />
      <el-table-column label="排序顺序" align="center" prop="sortOrder" />
      <el-table-column label="状态" align="center" prop="status" />
      <el-table-column label="更新时间" align="center" prop="updatedAt" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.updatedAt, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['resource:photo:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['resource:photo:remove']">删除</el-button>
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

    <!-- 添加或修改照片，管理影集中的照片对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="photoRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="所属影集ID" prop="albumId">
          <el-input v-model="form.albumId" placeholder="请输入所属影集ID" />
        </el-form-item>
        <el-form-item label="照片标题" prop="photoTitle">
          <el-input v-model="form.photoTitle" placeholder="请输入照片标题" />
        </el-form-item>
        <el-form-item label="照片URL" prop="photoUrl">
          <el-input v-model="form.photoUrl" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="照片描述" prop="photoDesc">
          <el-input v-model="form.photoDesc" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="水印图片URL" prop="watermarkUrl">
          <el-input v-model="form.watermarkUrl" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="水印位置" prop="watermarkPosition">
          <el-input v-model="form.watermarkPosition" placeholder="请输入水印位置" />
        </el-form-item>
        <el-form-item label="水印透明度" prop="watermarkOpacity">
          <el-input v-model="form.watermarkOpacity" placeholder="请输入水印透明度" />
        </el-form-item>
        <el-form-item label="排序顺序" prop="sortOrder">
          <el-input v-model="form.sortOrder" placeholder="请输入排序顺序" />
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

<script setup name="Photo">
import { listPhoto, getPhoto, delPhoto, addPhoto, updatePhoto } from "@/api/resource/photo"

const { proxy } = getCurrentInstance()

const photoList = ref([])
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
    albumId: null,
    photoTitle: null,
    photoDesc: null,
    status: null,
  },
  rules: {
    albumId: [
      { required: true, message: "所属影集ID不能为空", trigger: "blur" }
    ],
    photoTitle: [
      { required: true, message: "照片标题不能为空", trigger: "blur" }
    ],
    photoUrl: [
      { required: true, message: "照片URL不能为空", trigger: "blur" }
    ],
    photoDesc: [
      { required: true, message: "照片描述不能为空", trigger: "blur" }
    ],
    watermarkUrl: [
      { required: true, message: "水印图片URL不能为空", trigger: "blur" }
    ],
    watermarkPosition: [
      { required: true, message: "水印位置不能为空", trigger: "blur" }
    ],
    status: [
      { required: true, message: "状态不能为空", trigger: "change" }
    ],
    remark: [
      { required: true, message: "备注不能为空", trigger: "blur" }
    ]
  }
})

const { queryParams, form, rules } = toRefs(data)

/** 查询照片，管理影集中的照片列表 */
function getList() {
  loading.value = true
  listPhoto(queryParams.value).then(response => {
    photoList.value = response.rows
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
    albumId: null,
    photoTitle: null,
    photoUrl: null,
    photoDesc: null,
    watermarkUrl: null,
    watermarkPosition: null,
    watermarkOpacity: null,
    sortOrder: null,
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
  proxy.resetForm("photoRef")
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
  title.value = "添加照片，管理影集中的照片"
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset()
  const _id = row.id || ids.value
  getPhoto(_id).then(response => {
    form.value = response.data
    open.value = true
    title.value = "修改照片，管理影集中的照片"
  })
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["photoRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updatePhoto(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功")
          open.value = false
          getList()
        })
      } else {
        addPhoto(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除照片，管理影集中的照片编号为"' + _ids + '"的数据项？').then(function() {
    return delPhoto(_ids)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("删除成功")
  }).catch(() => {})
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('resource/photo/export', {
    ...queryParams.value
  }, `photo_${new Date().getTime()}.xlsx`)
}

getList()
</script>
