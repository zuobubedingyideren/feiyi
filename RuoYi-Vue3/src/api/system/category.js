import request from '@/utils/request'

// 查询非遗类别，记录非遗项目的分类信息列表
export function listCategory(query) {
  return request({
    url: '/system/category/list',
    method: 'get',
    params: query
  })
}

// 查询非遗类别，记录非遗项目的分类信息详细
export function getCategory(id) {
  return request({
    url: '/system/category/' + id,
    method: 'get'
  })
}

// 新增非遗类别，记录非遗项目的分类信息
export function addCategory(data) {
  return request({
    url: '/system/category',
    method: 'post',
    data: data
  })
}

// 修改非遗类别，记录非遗项目的分类信息
export function updateCategory(data) {
  return request({
    url: '/system/category',
    method: 'put',
    data: data
  })
}

// 删除非遗类别，记录非遗项目的分类信息
export function delCategory(id) {
  return request({
    url: '/system/category/' + id,
    method: 'delete'
  })
}
