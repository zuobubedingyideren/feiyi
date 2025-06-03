import request from '@/utils/request'

// 查询首页引言，管理首页引言内容列表
export function listIntroduction(query) {
  return request({
    url: '/home/introduction/list',
    method: 'get',
    params: query
  })
}

// 查询首页引言，管理首页引言内容详细
export function getIntroduction(id) {
  return request({
    url: '/home/introduction/' + id,
    method: 'get'
  })
}

// 新增首页引言，管理首页引言内容
export function addIntroduction(data) {
  return request({
    url: '/home/introduction',
    method: 'post',
    data: data
  })
}

// 修改首页引言，管理首页引言内容
export function updateIntroduction(data) {
  return request({
    url: '/home/introduction',
    method: 'put',
    data: data
  })
}

// 删除首页引言，管理首页引言内容
export function delIntroduction(id) {
  return request({
    url: '/home/introduction/' + id,
    method: 'delete'
  })
}
