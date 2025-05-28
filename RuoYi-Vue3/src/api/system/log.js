import request from '@/utils/request'

// 查询用户登录日志，记录系统登录活动和安全信息列表
export function listLog(query) {
  return request({
    url: '/system/log/list',
    method: 'get',
    params: query
  })
}

// 查询用户登录日志，记录系统登录活动和安全信息详细
export function getLog(id) {
  return request({
    url: '/system/log/' + id,
    method: 'get'
  })
}

// 新增用户登录日志，记录系统登录活动和安全信息
export function addLog(data) {
  return request({
    url: '/system/log',
    method: 'post',
    data: data
  })
}

// 修改用户登录日志，记录系统登录活动和安全信息
export function updateLog(data) {
  return request({
    url: '/system/log',
    method: 'put',
    data: data
  })
}

// 删除用户登录日志，记录系统登录活动和安全信息
export function delLog(id) {
  return request({
    url: '/system/log/' + id,
    method: 'delete'
  })
}
