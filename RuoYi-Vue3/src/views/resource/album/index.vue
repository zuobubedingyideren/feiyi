<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="影集名称" prop="albumName">
        <el-input
          v-model="queryParams.albumName"
          placeholder="请输入影集名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="图片年份" prop="albumYear">
        <el-input
          v-model="queryParams.albumYear"
          placeholder="请输入图片年份"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="图片作者" prop="photographer">
        <el-input
          v-model="queryParams.photographer"
          placeholder="请输入图片作者"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="发布日期" prop="releaseDate">
        <el-date-picker clearable
          v-model="queryParams.releaseDate"
          type="date"
          value-format="YYYY-MM-DD"
          placeholder="请选择发布日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="发布者" prop="publisher">
        <el-input
          v-model="queryParams.publisher"
          placeholder="请输入发布者"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否推荐" prop="isFeatured">
        <el-input
          v-model="queryParams.isFeatured"
          placeholder="请输入是否推荐"
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
          v-hasPermi="['resource:album:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['resource:album:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['resource:album:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['resource:album:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="albumList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="影集ID" align="center" prop="id" />
      <el-table-column label="影集名称" align="center" prop="albumName" />
      <el-table-column label="图片年份" align="center" prop="albumYear" />
      <el-table-column label="图片作者" align="center" prop="photographer" />
      <el-table-column label="作者介绍" align="center" prop="photographerBio" />
      <el-table-column label="影集介绍" align="center" prop="albumDesc" />
      <el-table-column label="封面图片URL" align="center" prop="coverImage" width="100">
        <template #default="scope">
          <image-preview :src="scope.row.coverImage" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="发布日期" align="center" prop="releaseDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.releaseDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="发布者" align="center" prop="publisher" />
      <el-table-column label="版权信息" align="center" prop="copyright" />
      <el-table-column label="浏览次数" align="center" prop="viewCount" />
      <el-table-column label="状态" align="center" prop="status" />
      <el-table-column label="是否推荐" align="center" prop="isFeatured" />
      <el-table-column label="更新时间" align="center" prop="updatedAt" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.updatedAt, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['resource:album:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['resource:album:remove']">删除</el-button>
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

    <!-- 添加或修改影集，管理影集信息对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="albumRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="影集名称" prop="albumName">
          <el-input v-model="form.albumName" placeholder="请输入影集名称" />
        </el-form-item>
        <el-form-item label="图片年份" prop="albumYear">
          <el-input v-model="form.albumYear" placeholder="请输入图片年份" />
        </el-form-item>
        <el-form-item label="图片作者" prop="photographer">
          <el-input v-model="form.photographer" placeholder="请输入图片作者" />
        </el-form-item>
        <el-form-item label="作者介绍" prop="photographerBio">
          <el-input v-model="form.photographerBio" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="影集介绍" prop="albumDesc">
          <el-input v-model="form.albumDesc" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="封面图片URL" prop="coverImage">
          <image-upload v-model="form.coverImage"/>
        </el-form-item>
        <el-form-item label="发布日期" prop="releaseDate">
          <el-date-picker clearable
            v-model="form.releaseDate"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择发布日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="发布者" prop="publisher">
          <el-input v-model="form.publisher" placeholder="请输入发布者" />
        </el-form-item>
        <el-form-item label="版权信息" prop="copyright">
          <el-input v-model="form.copyright" placeholder="请输入版权信息" />
        </el-form-item>
        <el-form-item label="浏览次数" prop="viewCount">
          <el-input v-model="form.viewCount" placeholder="请输入浏览次数" />
        </el-form-item>
        <el-form-item label="是否推荐" prop="isFeatured">
          <el-input v-model="form.isFeatured" placeholder="请输入是否推荐" />
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
        <el-divider content-position="center">照片，管理影集中的照片信息</el-divider>
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button type="primary" icon="Plus" @click="handleAddPhoto">添加</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" icon="Delete" @click="handleDeletePhoto">删除</el-button>
          </el-col>
        </el-row>
        <el-table :data="photoList" :row-class-name="rowPhotoIndex" @selection-change="handlePhotoSelectionChange" ref="photo">
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <el-table-column label="照片标题" prop="photoTitle" width="150">
            <template #default="scope">
              <el-input v-model="scope.row.photoTitle" placeholder="请输入照片标题" />
            </template>
          </el-table-column>
          <el-table-column label="水印位置" prop="watermarkPosition" width="150">
            <template #default="scope">
              <el-input v-model="scope.row.watermarkPosition" placeholder="请输入水印位置" />
            </template>
          </el-table-column>
          <el-table-column label="水印透明度" prop="watermarkOpacity" width="150">
            <template #default="scope">
              <el-input v-model="scope.row.watermarkOpacity" placeholder="请输入水印透明度" />
            </template>
          </el-table-column>
          <el-table-column label="排序顺序" prop="sortOrder" width="150">
            <template #default="scope">
              <el-input v-model="scope.row.sortOrder" placeholder="请输入排序顺序" />
            </template>
          </el-table-column>
          <el-table-column label="状态" prop="status" width="150">
            <template #default="scope">
              <el-select v-model="scope.row.status" placeholder="请选择状态">
                <el-option label="请选择字典生成" value="" />
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="更新时间" prop="updatedAt" width="240">
            <template #default="scope">
              <el-date-picker clearable
                v-model="scope.row.updatedAt"
                type="date"
                value-format="YYYY-MM-DD"
                placeholder="请选择更新时间">
              </el-date-picker>
            </template>
          </el-table-column>
          <el-table-column label="备注" prop="remark" width="150">
            <template #default="scope">
              <el-input v-model="scope.row.remark" placeholder="请输入备注" />
            </template>
          </el-table-column>
        </el-table>
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

<script setup name="Album">
import { listAlbum, getAlbum, delAlbum, addAlbum, updateAlbum } from "@/api/resource/album"

const { proxy } = getCurrentInstance()

const albumList = ref([])
const photoList = ref([])
const open = ref(false)
const loading = ref(true)
const showSearch = ref(true)
const ids = ref([])
const checkedPhoto = ref([])
const single = ref(true)
const multiple = ref(true)
const total = ref(0)
const title = ref("")

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    albumName: null,
    albumYear: null,
    photographer: null,
    photographerBio: null,
    albumDesc: null,
    releaseDate: null,
    publisher: null,
    status: null,
    isFeatured: null,
  },
  rules: {
    albumName: [
      { required: true, message: "影集名称不能为空", trigger: "blur" }
    ],
    albumYear: [
      { required: true, message: "图片年份不能为空", trigger: "blur" }
    ],
    photographer: [
      { required: true, message: "图片作者不能为空", trigger: "blur" }
    ],
    photographerBio: [
      { required: true, message: "作者介绍不能为空", trigger: "blur" }
    ],
    albumDesc: [
      { required: true, message: "影集介绍不能为空", trigger: "blur" }
    ],
    coverImage: [
      { required: true, message: "封面图片URL不能为空", trigger: "blur" }
    ],
    releaseDate: [
      { required: true, message: "发布日期不能为空", trigger: "blur" }
    ],
    publisher: [
      { required: true, message: "发布者不能为空", trigger: "blur" }
    ],
    isFeatured: [
      { required: true, message: "是否推荐不能为空", trigger: "blur" }
    ],
    createdAt: [
      { required: true, message: "创建时间不能为空", trigger: "blur" }
    ],
    remark: [
      { required: true, message: "备注不能为空", trigger: "blur" }
    ]
  }
})

const { queryParams, form, rules } = toRefs(data)

/** 查询影集，管理影集信息列表 */
function getList() {
  loading.value = true
  listAlbum(queryParams.value).then(response => {
    albumList.value = response.rows
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
    albumName: null,
    albumYear: null,
    photographer: null,
    photographerBio: null,
    albumDesc: null,
    coverImage: null,
    releaseDate: null,
    publisher: null,
    copyright: null,
    viewCount: null,
    status: null,
    isFeatured: null,
    createdAt: null,
    updatedAt: null,
    createdBy: null,
    updatedBy: null,
    delFlag: null,
    deletedAt: null,
    deletedBy: null,
    remark: null
  }
  photoList.value = []
  proxy.resetForm("albumRef")
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
  title.value = "添加影集，管理影集信息"
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset()
  const _id = row.id || ids.value
  getAlbum(_id).then(response => {
    form.value = response.data
    photoList.value = response.data.photoList
    open.value = true
    title.value = "修改影集，管理影集信息"
  })
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["albumRef"].validate(valid => {
    if (valid) {
      form.value.photoList = photoList.value
      if (form.value.id != null) {
        updateAlbum(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功")
          open.value = false
          getList()
        })
      } else {
        addAlbum(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除影集，管理影集信息编号为"' + _ids + '"的数据项？').then(function() {
    return delAlbum(_ids)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("删除成功")
  }).catch(() => {})
}

/** 照片，管理影集中的照片序号 */
function rowPhotoIndex({ row, rowIndex }) {
  row.index = rowIndex + 1
}

/** 照片，管理影集中的照片添加按钮操作 */
function handleAddPhoto() {
  let obj = {}
  obj.photoTitle = ""
  obj.photoUrl = ""
  obj.photoDesc = ""
  obj.watermarkUrl = ""
  obj.watermarkPosition = ""
  obj.watermarkOpacity = ""
  obj.sortOrder = ""
  obj.status = ""
  obj.updatedAt = ""
  obj.remark = ""
  photoList.value.push(obj)
}

/** 照片，管理影集中的照片删除按钮操作 */
function handleDeletePhoto() {
  if (checkedPhoto.value.length == 0) {
    proxy.$modal.msgError("请先选择要删除的照片，管理影集中的照片数据")
  } else {
    const photos = photoList.value
    const checkedPhotos = checkedPhoto.value
    photoList.value = photos.filter(function(item) {
      return checkedPhotos.indexOf(item.index) == -1
    })
  }
}

/** 复选框选中数据 */
function handlePhotoSelectionChange(selection) {
  checkedPhoto.value = selection.map(item => item.index)
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('resource/album/export', {
    ...queryParams.value
  }, `album_${new Date().getTime()}.xlsx`)
}

getList()
</script>
