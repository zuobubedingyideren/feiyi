import request from '@/utils/request'

// 查询视频，管理视频资源信息列表
export function listVideo(query) {
  return request({
    url: '/resource/video/list',
    method: 'get',
    params: query
  })
}

// 查询视频，管理视频资源信息详细
export function getVideo(id) {
  return request({
    url: '/resource/video/' + id,
    method: 'get'
  })
}

// 新增视频，管理视频资源信息
export function addVideo(data) {
  return request({
    url: '/resource/video',
    method: 'post',
    data: data
  })
}

// 修改视频，管理视频资源信息
export function updateVideo(data) {
  return request({
    url: '/resource/video',
    method: 'put',
    data: data
  })
}

// 删除视频，管理视频资源信息
export function delVideo(id) {
  return request({
    url: '/resource/video/' + id,
    method: 'delete'
  })
}
