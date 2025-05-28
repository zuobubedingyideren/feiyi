import request from '@/utils/request'

// 查询访谈，管理学者、传承人等访谈内容列表
export function listInterview(query) {
  return request({
    url: '/system/interview/list',
    method: 'get',
    params: query
  })
}

// 查询访谈，管理学者、传承人等访谈内容详细
export function getInterview(id) {
  return request({
    url: '/system/interview/' + id,
    method: 'get'
  })
}

// 新增访谈，管理学者、传承人等访谈内容
export function addInterview(data) {
  return request({
    url: '/system/interview',
    method: 'post',
    data: data
  })
}

// 修改访谈，管理学者、传承人等访谈内容
export function updateInterview(data) {
  return request({
    url: '/system/interview',
    method: 'put',
    data: data
  })
}

// 删除访谈，管理学者、传承人等访谈内容
export function delInterview(id) {
  return request({
    url: '/system/interview/' + id,
    method: 'delete'
  })
}
