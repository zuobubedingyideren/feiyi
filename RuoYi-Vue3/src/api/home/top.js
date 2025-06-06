import request from '@/utils/request'

// 查询置顶项目，管理世界名录中的置顶项目列表
export function listTop(query) {
  return request({
    url: '/home/top/list',
    method: 'get',
    params: query
  })
}

// 查询置顶项目，管理世界名录中的置顶项目详细
export function getTop(id) {
  return request({
    url: '/home/top/' + id,
    method: 'get'
  })
}

// 新增置顶项目，管理世界名录中的置顶项目
export function addTop(data) {
  return request({
    url: '/home/top',
    method: 'post',
    data: data
  })
}

// 修改置顶项目，管理世界名录中的置顶项目
export function updateTop(data) {
  return request({
    url: '/home/top',
    method: 'put',
    data: data
  })
}

// 删除置顶项目，管理世界名录中的置顶项目
export function delTop(id) {
  return request({
    url: '/home/top/' + id,
    method: 'delete'
  })
}
