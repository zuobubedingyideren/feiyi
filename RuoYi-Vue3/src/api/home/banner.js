import request from '@/utils/request'

// 查询Banner图片管理列表
export function listBanner(query) {
  return request({
    url: '/home/banner/list',
    method: 'get',
    params: query
  })
}

// 查询Banner图片管理详细
export function getBanner(bannerId) {
  return request({
    url: '/home/banner/' + bannerId,
    method: 'get'
  })
}

// 新增Banner图片管理
export function addBanner(data) {
  return request({
    url: '/home/banner',
    method: 'post',
    data: data
  })
}

// 修改Banner图片管理
export function updateBanner(data) {
  return request({
    url: '/home/banner',
    method: 'put',
    data: data
  })
}

// 删除Banner图片管理
export function delBanner(bannerId) {
  return request({
    url: '/home/banner/' + bannerId,
    method: 'delete'
  })
}
