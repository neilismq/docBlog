// nav
module.exports = [
  { text: '首页', link: '/' },
  {
    text: '工作日志',
    link: '/workLog/'
  },
  {
    text: 'Java基础',
    link: '/javaBase/'
  },
  {
    text: '工具',
    items: [
      {
        text: 'Git',
        link: '/pages/ee8db5/',
      },
      {
        text: '快捷键',
        link: '/pages/558cc9/',
      }
    ]
  },
  {
    text: '常见中间件',
    link:'/popularMedContains',
    items: [
      {
        text: 'Redis',
        link: '/pages/ee8dbb/',
      }
    ]
  },
  {
    text: '操作系统',
    items: [
      {
        text: 'Linux',
        link: '/linux/',
      }
    ]
  },
  {
    text: '分类',
    link: '/categories/'
  },
  {
    text: '标签',
    link: '/tags/'
  },
  {
    text: '归档',
    link: '/archives/'
  },
]
