<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="轮播图标题" prop="title">
        <el-input
          v-model="queryParams.title"
          placeholder="请输入轮播图标题"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="轮播图片地址" prop="imageUrl">
        <el-input
          v-model="queryParams.imageUrl"
          placeholder="请输入轮播图片地址"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="点击轮播图跳转的链接" prop="linkUrl">
        <el-input
          v-model="queryParams.linkUrl"
          placeholder="请输入点击轮播图跳转的链接"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="显示顺序，数值越小越靠前" prop="displayOrder">
        <el-input
          v-model="queryParams.displayOrder"
          placeholder="请输入显示顺序，数值越小越靠前"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="图片宽高比" prop="aspectRatio">
        <el-input
          v-model="queryParams.aspectRatio"
          placeholder="请输入图片宽高比"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="记录创建时间" prop="createdAt">
        <el-date-picker clearable
          v-model="queryParams.createdAt"
          type="date"
          value-format="YYYY-MM-DD"
          placeholder="请选择记录创建时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="记录更新时间" prop="updatedAt">
        <el-date-picker clearable
          v-model="queryParams.updatedAt"
          type="date"
          value-format="YYYY-MM-DD"
          placeholder="请选择记录更新时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="创建人ID" prop="createdBy">
        <el-input
          v-model="queryParams.createdBy"
          placeholder="请输入创建人ID"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="更新人ID" prop="updatedBy">
        <el-input
          v-model="queryParams.updatedBy"
          placeholder="请输入更新人ID"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="逻辑删除标志：0-未删除，1-已删除" prop="isDeleted">
        <el-input
          v-model="queryParams.isDeleted"
          placeholder="请输入逻辑删除标志：0-未删除，1-已删除"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="删除时间" prop="deletedAt">
        <el-date-picker clearable
          v-model="queryParams.deletedAt"
          type="date"
          value-format="YYYY-MM-DD"
          placeholder="请选择删除时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="删除人ID" prop="deletedBy">
        <el-input
          v-model="queryParams.deletedBy"
          placeholder="请输入删除人ID"
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
          v-hasPermi="['home:banner:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['home:banner:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['home:banner:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['home:banner:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="bannerList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="轮播图唯一标识，自增主键" align="center" prop="id" />
      <el-table-column label="轮播图标题" align="center" prop="title" />
      <el-table-column label="轮播图片地址" align="center" prop="imageUrl" />
      <el-table-column label="点击轮播图跳转的链接" align="center" prop="linkUrl" />
      <el-table-column label="页面类型" align="center" prop="pageType" />
      <el-table-column label="显示顺序，数值越小越靠前" align="center" prop="displayOrder" />
      <el-table-column label="轮播图状态：1-显示，0-隐藏" align="center" prop="status" />
      <el-table-column label="图片宽高比" align="center" prop="aspectRatio" />
      <el-table-column label="记录创建时间" align="center" prop="createdAt" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.createdAt, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="记录更新时间" align="center" prop="updatedAt" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.updatedAt, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="创建人ID" align="center" prop="createdBy" />
      <el-table-column label="更新人ID" align="center" prop="updatedBy" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['home:banner:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['home:banner:remove']">删除</el-button>
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

    <!-- 添加或修改首页轮播图，管理首页展示的图片及跳转链接对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="bannerRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="轮播图标题" prop="title">
          <el-input v-model="form.title" placeholder="请输入轮播图标题" />
        </el-form-item>
        <el-form-item label="轮播图片地址" prop="imageUrl">
          <el-input v-model="form.imageUrl" placeholder="请输入轮播图片地址" />
        </el-form-item>
        <el-form-item label="点击轮播图跳转的链接" prop="linkUrl">
          <el-input v-model="form.linkUrl" placeholder="请输入点击轮播图跳转的链接" />
        </el-form-item>
        <el-form-item label="显示顺序，数值越小越靠前" prop="displayOrder">
          <el-input v-model="form.displayOrder" placeholder="请输入显示顺序，数值越小越靠前" />
        </el-form-item>
        <el-form-item label="图片宽高比" prop="aspectRatio">
          <el-input v-model="form.aspectRatio" placeholder="请输入图片宽高比" />
        </el-form-item>
        <el-form-item label="创建人ID" prop="createdBy">
          <el-input v-model="form.createdBy" placeholder="请输入创建人ID" />
        </el-form-item>
        <el-form-item label="更新人ID" prop="updatedBy">
          <el-input v-model="form.updatedBy" placeholder="请输入更新人ID" />
        </el-form-item>
        <el-form-item label="逻辑删除标志：0-未删除，1-已删除" prop="isDeleted">
          <el-input v-model="form.isDeleted" placeholder="请输入逻辑删除标志：0-未删除，1-已删除" />
        </el-form-item>
        <el-form-item label="删除人ID" prop="deletedBy">
          <el-input v-model="form.deletedBy" placeholder="请输入删除人ID" />
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

<script setup name="Banner">
import { listBanner, getBanner, delBanner, addBanner, updateBanner } from "@/api/home/banner"

const { proxy } = getCurrentInstance()

const bannerList = ref([])
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
    imageUrl: null,
    linkUrl: null,
    pageType: null,
    displayOrder: null,
    status: null,
    aspectRatio: null,
    createdAt: null,
    updatedAt: null,
    createdBy: null,
    updatedBy: null,
    isDeleted: null,
    deletedAt: null,
    deletedBy: null
  },
  rules: {
    title: [
      { required: true, message: "轮播图标题不能为空", trigger: "blur" }
    ],
    imageUrl: [
      { required: true, message: "轮播图片地址不能为空", trigger: "blur" }
    ],
    pageType: [
      { required: true, message: "页面类型不能为空", trigger: "change" }
    ],
    createdAt: [
      { required: true, message: "记录创建时间不能为空", trigger: "blur" }
    ],
  }
})

const { queryParams, form, rules } = toRefs(data)

/** 查询首页轮播图，管理首页展示的图片及跳转链接列表 */
function getList() {
  loading.value = true
  listBanner(queryParams.value).then(response => {
    bannerList.value = response.rows
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
    imageUrl: null,
    linkUrl: null,
    pageType: null,
    displayOrder: null,
    status: null,
    aspectRatio: null,
    createdAt: null,
    updatedAt: null,
    createdBy: null,
    updatedBy: null,
    isDeleted: null,
    deletedAt: null,
    deletedBy: null
  }
  proxy.resetForm("bannerRef")
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
  title.value = "添加首页轮播图，管理首页展示的图片及跳转链接"
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset()
  const _id = row.id || ids.value
  getBanner(_id).then(response => {
    form.value = response.data
    open.value = true
    title.value = "修改首页轮播图，管理首页展示的图片及跳转链接"
  })
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["bannerRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateBanner(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功")
          open.value = false
          getList()
        })
      } else {
        addBanner(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除首页轮播图，管理首页展示的图片及跳转链接编号为"' + _ids + '"的数据项？').then(function() {
    return delBanner(_ids)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("删除成功")
  }).catch(() => {})
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('home/banner/export', {
    ...queryParams.value
  }, `banner_${new Date().getTime()}.xlsx`)
}

getList()
</script>
