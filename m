Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 871F577CEF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 03:11:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7T3B5Uv005294
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 20:11:05 -0700
Received: from [128.224.162.212] (128.224.162.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 28 Aug 2017 20:11:04 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1503390555.git.kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <16dee72e-9f83-322c-1021-798bc910cff1@windriver.com>
Date: Tue, 29 Aug 2017 11:13:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <cover.1503390555.git.kai.kang@windriver.com>
Subject: Re: [PATCH 0/1] watchdog: enable systemd support
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
X-List-Received-Date: Tue, 29 Aug 2017 03:11:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2017年08月22日 16:29, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> The following changes since commit 04dc76713b57f28457742dd863caa663591d4866:
>
>    devtool/copy_buildsystem: adds meta-skeleton layer in the eSDK installation. (2017-08-19 22:15:39 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib kangkai/watchdog
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/watchdog
>
> Kai Kang (1):
>    watchdog: enable systemd support

Ping.


--Kai


>
>   meta/recipes-extended/watchdog/watchdog_5.15.bb | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
>

-- 
Regards,
Neil | Kai Kang


