import request from '@/utils/request'

// 查询首页轮播图，管理首页展示的图片及跳转链接列表
export function listBanner(query) {
  return request({
    url: '/home/banner/list',
    method: 'get',
    params: query
  })
}

// 查询首页轮播图，管理首页展示的图片及跳转链接详细
export function getBanner(id) {
  return request({
    url: '/home/banner/' + id,
    method: 'get'
  })
}

// 新增首页轮播图，管理首页展示的图片及跳转链接
export function addBanner(data) {
  return request({
    url: '/home/banner',
    method: 'post',
    data: data
  })
}

// 修改首页轮播图，管理首页展示的图片及跳转链接
export function updateBanner(data) {
  return request({
    url: '/home/banner',
    method: 'put',
    data: data
  })
}

// 删除首页轮播图，管理首页展示的图片及跳转链接
export function delBanner(id) {
  return request({
    url: '/home/banner/' + id,
    method: 'delete'
  })
}
