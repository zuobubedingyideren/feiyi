import request from '@/utils/request'

// 查询学术资源，管理非遗项目相关的学术资源列表
export function listResource(query) {
  return request({
    url: '/catalog/resource/list',
    method: 'get',
    params: query
  })
}

// 查询学术资源，管理非遗项目相关的学术资源详细
export function getResource(id) {
  return request({
    url: '/catalog/resource/' + id,
    method: 'get'
  })
}

// 新增学术资源，管理非遗项目相关的学术资源
export function addResource(data) {
  return request({
    url: '/catalog/resource',
    method: 'post',
    data: data
  })
}

// 修改学术资源，管理非遗项目相关的学术资源
export function updateResource(data) {
  return request({
    url: '/catalog/resource',
    method: 'put',
    data: data
  })
}

// 删除学术资源，管理非遗项目相关的学术资源
export function delResource(id) {
  return request({
    url: '/catalog/resource/' + id,
    method: 'delete'
  })
}
