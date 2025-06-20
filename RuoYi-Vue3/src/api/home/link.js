import request from '@/utils/request'

// 查询友情链接，管理页脚友情链接列表
export function listLink(query) {
  return request({
    url: '/home/footer/link/list',
    method: 'get',
    params: query
  })
}

// 查询友情链接，管理页脚友情链接详细
export function getLink(id) {
  return request({
    url: '/home/footer/link/' + id,
    method: 'get'
  })
}

// 新增友情链接，管理页脚友情链接
export function addLink(data) {
  return request({
    url: '/home/footer/link',
    method: 'post',
    data: data
  })
}

// 修改友情链接，管理页脚友情链接
export function updateLink(data) {
  return request({
    url: '/home/footer/link',
    method: 'put',
    data: data
  })
}

// 删除友情链接，管理页脚友情链接
export function delLink(id) {
  return request({
    url: '/home/footer/link/' + id,
    method: 'delete'
  })
}
