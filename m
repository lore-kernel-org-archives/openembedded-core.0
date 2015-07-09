Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4560F607A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 02:29:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t692TQeh004924
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jul 2015 19:29:26 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 8 Jul 2015 19:29:25 -0700
Message-ID: <559DDC87.9000003@windriver.com>
Date: Thu, 9 Jul 2015 10:29:27 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1435720976.git.kai.kang@windriver.com>
In-Reply-To: <cover.1435720976.git.kai.kang@windriver.com>
Subject: Re: [PATCH 0/1] Fix build path in expect-dev pkg
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Jul 2015 02:29:30 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年07月01日 11:24, Kai Kang wrote:
> The following changes since commit 410a6377493ebf3fa21045c390693f021149c241:
>
>    bitbake: tests/data: Add new data tests (2015-06-30 09:06:35 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib kangkai/expect
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/expect
>
> Yue Tao (1):
>    expect: replace the STAGING_INCDIR with includedir

Ping?


>
>   meta/recipes-devtools/expect/expect_5.45.bb | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
>


-- 
Regards,
Neil | Kai Kang


