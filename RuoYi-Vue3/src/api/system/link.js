import request from '@/utils/request'

// 查询首页友情链接，管理首页展示的外部链接列表
export function listLink(query) {
  return request({
    url: '/system/link/list',
    method: 'get',
    params: query
  })
}

// 查询首页友情链接，管理首页展示的外部链接详细
export function getLink(id) {
  return request({
    url: '/system/link/' + id,
    method: 'get'
  })
}

// 新增首页友情链接，管理首页展示的外部链接
export function addLink(data) {
  return request({
    url: '/system/link',
    method: 'post',
    data: data
  })
}

// 修改首页友情链接，管理首页展示的外部链接
export function updateLink(data) {
  return request({
    url: '/system/link',
    method: 'put',
    data: data
  })
}

// 删除首页友情链接，管理首页展示的外部链接
export function delLink(id) {
  return request({
    url: '/system/link/' + id,
    method: 'delete'
  })
}
