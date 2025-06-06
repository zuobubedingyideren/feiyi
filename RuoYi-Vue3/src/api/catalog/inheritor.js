import request from '@/utils/request'

// 查询非遗传承人列表
export function listInheritor(query) {
  return request({
    url: '/catalog/inheritor/list',
    method: 'get',
    params: query
  })
}

// 查询非遗传承人详细
export function getInheritor(id) {
  return request({
    url: '/catalog/inheritor/' + id,
    method: 'get'
  })
}

// 新增非遗传承人
export function addInheritor(data) {
  return request({
    url: '/catalog/inheritor',
    method: 'post',
    data: data
  })
}

// 修改非遗传承人
export function updateInheritor(data) {
  return request({
    url: '/catalog/inheritor',
    method: 'put',
    data: data
  })
}

// 删除非遗传承人
export function delInheritor(id) {
  return request({
    url: '/catalog/inheritor/' + id,
    method: 'delete'
  })
}
