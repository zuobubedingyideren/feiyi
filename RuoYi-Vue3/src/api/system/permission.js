import request from '@/utils/request'

// 查询系统权限，定义细粒度的操作权限列表
export function listPermission(query) {
  return request({
    url: '/system/permission/list',
    method: 'get',
    params: query
  })
}

// 查询系统权限，定义细粒度的操作权限详细
export function getPermission(id) {
  return request({
    url: '/system/permission/' + id,
    method: 'get'
  })
}

// 新增系统权限，定义细粒度的操作权限
export function addPermission(data) {
  return request({
    url: '/system/permission',
    method: 'post',
    data: data
  })
}

// 修改系统权限，定义细粒度的操作权限
export function updatePermission(data) {
  return request({
    url: '/system/permission',
    method: 'put',
    data: data
  })
}

// 删除系统权限，定义细粒度的操作权限
export function delPermission(id) {
  return request({
    url: '/system/permission/' + id,
    method: 'delete'
  })
}
