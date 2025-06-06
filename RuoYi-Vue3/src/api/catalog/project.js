import request from '@/utils/request'

// 查询非遗项目，管理非遗项目信息列表
export function listProject(query) {
  return request({
    url: '/catalog/project/list',
    method: 'get',
    params: query
  })
}

// 查询非遗项目，管理非遗项目信息详细
export function getProject(id) {
  return request({
    url: '/catalog/project/' + id,
    method: 'get'
  })
}

// 新增非遗项目，管理非遗项目信息
export function addProject(data) {
  return request({
    url: '/catalog/project',
    method: 'post',
    data: data
  })
}

// 修改非遗项目，管理非遗项目信息
export function updateProject(data) {
  return request({
    url: '/catalog/project',
    method: 'put',
    data: data
  })
}

// 删除非遗项目，管理非遗项目信息
export function delProject(id) {
  return request({
    url: '/catalog/project/' + id,
    method: 'delete'
  })
}
