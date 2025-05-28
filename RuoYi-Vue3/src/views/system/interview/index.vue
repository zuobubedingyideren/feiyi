<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="访谈标题" prop="title">
        <el-input
          v-model="queryParams.title"
          placeholder="请输入访谈标题"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="受访者姓名" prop="interviewee">
        <el-input
          v-model="queryParams.interviewee"
          placeholder="请输入受访者姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="受访者头像" prop="avatarUrl">
        <el-input
          v-model="queryParams.avatarUrl"
          placeholder="请输入受访者头像"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="受访者简介" prop="shortBio">
        <el-input
          v-model="queryParams.shortBio"
          placeholder="请输入受访者简介"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="访谈日期" prop="interviewDate">
        <el-date-picker clearable
          v-model="queryParams.interviewDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择访谈日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="是否推荐：1-推荐，0-不推荐" prop="featured">
        <el-input
          v-model="queryParams.featured"
          placeholder="请输入是否推荐：1-推荐，0-不推荐"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="浏览次数" prop="viewCount">
        <el-input
          v-model="queryParams.viewCount"
          placeholder="请输入浏览次数"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="显示顺序" prop="displayOrder">
        <el-input
          v-model="queryParams.displayOrder"
          placeholder="请输入显示顺序"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="记录创建时间" prop="createdAt">
        <el-date-picker clearable
          v-model="queryParams.createdAt"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择记录创建时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="记录更新时间" prop="updatedAt">
        <el-date-picker clearable
          v-model="queryParams.updatedAt"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择记录更新时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="创建人ID" prop="createdBy">
        <el-input
          v-model="queryParams.createdBy"
          placeholder="请输入创建人ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="更新人ID" prop="updatedBy">
        <el-input
          v-model="queryParams.updatedBy"
          placeholder="请输入更新人ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="逻辑删除标志：0-未删除，1-已删除" prop="isDeleted">
        <el-input
          v-model="queryParams.isDeleted"
          placeholder="请输入逻辑删除标志：0-未删除，1-已删除"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="删除时间" prop="deletedAt">
        <el-date-picker clearable
          v-model="queryParams.deletedAt"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择删除时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="删除人ID" prop="deletedBy">
        <el-input
          v-model="queryParams.deletedBy"
          placeholder="请输入删除人ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:interview:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:interview:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:interview:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:interview:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="interviewList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="访谈唯一标识，自增主键" align="center" prop="id" />
      <el-table-column label="访谈标题" align="center" prop="title" />
      <el-table-column label="受访者姓名" align="center" prop="interviewee" />
      <el-table-column label="受访者头像" align="center" prop="avatarUrl" />
      <el-table-column label="受访者简介" align="center" prop="shortBio" />
      <el-table-column label="访谈日期" align="center" prop="interviewDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.interviewDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="访谈内容" align="center" prop="content" />
      <el-table-column label="是否推荐：1-推荐，0-不推荐" align="center" prop="featured" />
      <el-table-column label="浏览次数" align="center" prop="viewCount" />
      <el-table-column label="显示顺序" align="center" prop="displayOrder" />
      <el-table-column label="访谈状态：1-显示，0-隐藏" align="center" prop="status" />
      <el-table-column label="记录创建时间" align="center" prop="createdAt" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createdAt, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="记录更新时间" align="center" prop="updatedAt" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.updatedAt, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="创建人ID" align="center" prop="createdBy" />
      <el-table-column label="更新人ID" align="center" prop="updatedBy" />
      <el-table-column label="逻辑删除标志：0-未删除，1-已删除" align="center" prop="isDeleted" />
      <el-table-column label="删除时间" align="center" prop="deletedAt" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.deletedAt, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="删除人ID" align="center" prop="deletedBy" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:interview:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:interview:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改访谈，管理学者、传承人等访谈内容对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
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
            value-format="yyyy-MM-dd"
            placeholder="请选择访谈日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="访谈内容">
          <editor v-model="form.content" :min-height="192"/>
        </el-form-item>
        <el-form-item label="是否推荐：1-推荐，0-不推荐" prop="featured">
          <el-input v-model="form.featured" placeholder="请输入是否推荐：1-推荐，0-不推荐" />
        </el-form-item>
        <el-form-item label="浏览次数" prop="viewCount">
          <el-input v-model="form.viewCount" placeholder="请输入浏览次数" />
        </el-form-item>
        <el-form-item label="显示顺序" prop="displayOrder">
          <el-input v-model="form.displayOrder" placeholder="请输入显示顺序" />
        </el-form-item>
        <el-form-item label="记录创建时间" prop="createdAt">
          <el-date-picker clearable
            v-model="form.createdAt"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择记录创建时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="记录更新时间" prop="updatedAt">
          <el-date-picker clearable
            v-model="form.updatedAt"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择记录更新时间">
          </el-date-picker>
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
        <el-form-item label="删除时间" prop="deletedAt">
          <el-date-picker clearable
            v-model="form.deletedAt"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择删除时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="删除人ID" prop="deletedBy">
          <el-input v-model="form.deletedBy" placeholder="请输入删除人ID" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listInterview, getInterview, delInterview, addInterview, updateInterview } from "@/api/system/interview"

export default {
  name: "Interview",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 访谈，管理学者、传承人等访谈内容表格数据
      interviewList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
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
        isDeleted: null,
        deletedAt: null,
        deletedBy: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        title: [
          { required: true, message: "访谈标题不能为空", trigger: "blur" }
        ],
        content: [
          { required: true, message: "访谈内容不能为空", trigger: "blur" }
        ],
        createdAt: [
          { required: true, message: "记录创建时间不能为空", trigger: "blur" }
        ],
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询访谈，管理学者、传承人等访谈内容列表 */
    getList() {
      this.loading = true
      listInterview(this.queryParams).then(response => {
        this.interviewList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    // 表单重置
    reset() {
      this.form = {
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
        isDeleted: null,
        deletedAt: null,
        deletedBy: null
      }
      this.resetForm("form")
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm")
      this.handleQuery()
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加访谈，管理学者、传承人等访谈内容"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const id = row.id || this.ids
      getInterview(id).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改访谈，管理学者、传承人等访谈内容"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateInterview(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addInterview(this.form).then(response => {
              this.$modal.msgSuccess("新增成功")
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids
      this.$modal.confirm('是否确认删除访谈，管理学者、传承人等访谈内容编号为"' + ids + '"的数据项？').then(function() {
        return delInterview(ids)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/interview/export', {
        ...this.queryParams
      }, `interview_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
