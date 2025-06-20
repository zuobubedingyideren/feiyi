<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="登录用户ID，外键关联用户表" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入登录用户ID，外键关联用户表"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="登录用户名" prop="username">
        <el-input
          v-model="queryParams.username"
          placeholder="请输入登录用户名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="登录IP地址" prop="loginIp">
        <el-input
          v-model="queryParams.loginIp"
          placeholder="请输入登录IP地址"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="登录地理位置" prop="loginLocation">
        <el-input
          v-model="queryParams.loginLocation"
          placeholder="请输入登录地理位置"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="登录浏览器类型" prop="browser">
        <el-input
          v-model="queryParams.browser"
          placeholder="请输入登录浏览器类型"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="登录操作系统" prop="os">
        <el-input
          v-model="queryParams.os"
          placeholder="请输入登录操作系统"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="登录消息或错误描述" prop="msg">
        <el-input
          v-model="queryParams.msg"
          placeholder="请输入登录消息或错误描述"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="登录时间" prop="loginTime">
        <el-date-picker clearable
          v-model="queryParams.loginTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择登录时间">
        </el-date-picker>
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
          v-hasPermi="['system:log:add']"
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
          v-hasPermi="['system:log:edit']"
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
          v-hasPermi="['system:log:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:log:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="logList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="登录日志唯一标识，自增主键" align="center" prop="id" />
      <el-table-column label="登录用户ID，外键关联用户表" align="center" prop="userId" />
      <el-table-column label="登录用户名" align="center" prop="username" />
      <el-table-column label="登录IP地址" align="center" prop="loginIp" />
      <el-table-column label="登录地理位置" align="center" prop="loginLocation" />
      <el-table-column label="登录浏览器类型" align="center" prop="browser" />
      <el-table-column label="登录操作系统" align="center" prop="os" />
      <el-table-column label="登录状态：1-成功，0-失败" align="center" prop="status" />
      <el-table-column label="登录消息或错误描述" align="center" prop="msg" />
      <el-table-column label="登录时间" align="center" prop="loginTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.loginTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:log:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:log:remove']"
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

    <!-- 添加或修改用户登录日志，记录系统登录活动和安全信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="登录用户ID，外键关联用户表" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入登录用户ID，外键关联用户表" />
        </el-form-item>
        <el-form-item label="登录用户名" prop="username">
          <el-input v-model="form.username" placeholder="请输入登录用户名" />
        </el-form-item>
        <el-form-item label="登录IP地址" prop="loginIp">
          <el-input v-model="form.loginIp" placeholder="请输入登录IP地址" />
        </el-form-item>
        <el-form-item label="登录地理位置" prop="loginLocation">
          <el-input v-model="form.loginLocation" placeholder="请输入登录地理位置" />
        </el-form-item>
        <el-form-item label="登录浏览器类型" prop="browser">
          <el-input v-model="form.browser" placeholder="请输入登录浏览器类型" />
        </el-form-item>
        <el-form-item label="登录操作系统" prop="os">
          <el-input v-model="form.os" placeholder="请输入登录操作系统" />
        </el-form-item>
        <el-form-item label="登录消息或错误描述" prop="msg">
          <el-input v-model="form.msg" placeholder="请输入登录消息或错误描述" />
        </el-form-item>
        <el-form-item label="登录时间" prop="loginTime">
          <el-date-picker clearable
            v-model="form.loginTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择登录时间">
          </el-date-picker>
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
import { listLog, getLog, delLog, addLog, updateLog } from "@/api/system/log"

export default {
  name: "Log",
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
      // 用户登录日志，记录系统登录活动和安全信息表格数据
      logList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
        username: null,
        loginIp: null,
        loginLocation: null,
        browser: null,
        os: null,
        status: null,
        msg: null,
        loginTime: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询用户登录日志，记录系统登录活动和安全信息列表 */
    getList() {
      this.loading = true
      listLog(this.queryParams).then(response => {
        this.logList = response.rows
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
        userId: null,
        username: null,
        loginIp: null,
        loginLocation: null,
        browser: null,
        os: null,
        status: null,
        msg: null,
        loginTime: null
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
      this.title = "添加用户登录日志，记录系统登录活动和安全信息"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const id = row.id || this.ids
      getLog(id).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改用户登录日志，记录系统登录活动和安全信息"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateLog(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addLog(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除用户登录日志，记录系统登录活动和安全信息编号为"' + ids + '"的数据项？').then(function() {
        return delLog(ids)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/log/export', {
        ...this.queryParams
      }, `log_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
