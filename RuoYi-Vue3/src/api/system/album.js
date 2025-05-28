import request from '@/utils/request'

// 查询照片相册，管理各类照片相册信息列表
export function listAlbum(query) {
  return request({
    url: '/system/album/list',
    method: 'get',
    params: query
  })
}

// 查询照片相册，管理各类照片相册信息详细
export function getAlbum(id) {
  return request({
    url: '/system/album/' + id,
    method: 'get'
  })
}

// 新增照片相册，管理各类照片相册信息
export function addAlbum(data) {
  return request({
    url: '/system/album',
    method: 'post',
    data: data
  })
}

// 修改照片相册，管理各类照片相册信息
export function updateAlbum(data) {
  return request({
    url: '/system/album',
    method: 'put',
    data: data
  })
}

// 删除照片相册，管理各类照片相册信息
export function delAlbum(id) {
  return request({
    url: '/system/album/' + id,
    method: 'delete'
  })
}
