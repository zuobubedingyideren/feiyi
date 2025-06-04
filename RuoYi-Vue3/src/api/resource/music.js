import request from '@/utils/request'

// 查询音乐，管理音乐资源信息列表
export function listMusic(query) {
  return request({
    url: '/resource/music/list',
    method: 'get',
    params: query
  })
}

// 查询音乐，管理音乐资源信息详细
export function getMusic(id) {
  return request({
    url: '/resource/music/' + id,
    method: 'get'
  })
}

// 新增音乐，管理音乐资源信息
export function addMusic(data) {
  return request({
    url: '/resource/music',
    method: 'post',
    data: data
  })
}

// 修改音乐，管理音乐资源信息
export function updateMusic(data) {
  return request({
    url: '/resource/music',
    method: 'put',
    data: data
  })
}

// 删除音乐，管理音乐资源信息
export function delMusic(id) {
  return request({
    url: '/resource/music/' + id,
    method: 'delete'
  })
}
