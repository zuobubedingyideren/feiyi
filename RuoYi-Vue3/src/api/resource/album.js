import request from '@/utils/request'

// 查询影集，管理影集信息列表
export function listAlbum(query) {
  return request({
    url: '/resource/album/list',
    method: 'get',
    params: query
  })
}

// 查询影集，管理影集信息详细
export function getAlbum(id) {
  return request({
    url: '/resource/album/' + id,
    method: 'get'
  })
}

// 新增影集，管理影集信息
export function addAlbum(data) {
  return request({
    url: '/resource/album',
    method: 'post',
    data: data
  })
}

// 修改影集，管理影集信息
export function updateAlbum(data) {
  return request({
    url: '/resource/album',
    method: 'put',
    data: data
  })
}

// 删除影集，管理影集信息
export function delAlbum(id) {
  return request({
    url: '/resource/album/' + id,
    method: 'delete'
  })
}
