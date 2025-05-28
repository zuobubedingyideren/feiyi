import request from '@/utils/request'

// 查询首页简介，管理首页展示的简介内容列表
export function listIntroduction(query) {
  return request({
    url: '/system/introduction/list',
    method: 'get',
    params: query
  })
}

// 查询首页简介，管理首页展示的简介内容详细
export function getIntroduction(id) {
  return request({
    url: '/system/introduction/' + id,
    method: 'get'
  })
}

// 新增首页简介，管理首页展示的简介内容
export function addIntroduction(data) {
  return request({
    url: '/system/introduction',
    method: 'post',
    data: data
  })
}

// 修改首页简介，管理首页展示的简介内容
export function updateIntroduction(data) {
  return request({
    url: '/system/introduction',
    method: 'put',
    data: data
  })
}

// 删除首页简介，管理首页展示的简介内容
export function delIntroduction(id) {
  return request({
    url: '/system/introduction/' + id,
    method: 'delete'
  })
}
