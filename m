Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B95E479A6A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 07:32:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9F7VLQX018545
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 00:32:30 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 15 Oct 2018 00:32:21 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1539579939.git.kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <40a1e55a-4ba6-5d03-264f-86df8bee85a2@windriver.com>
Date: Mon, 15 Oct 2018 15:29:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <cover.1539579939.git.kai.kang@windriver.com>
Subject: Re: [PATCH v2 0/1] image.bbclass: set consistent staging dirs
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
X-List-Received-Date: Mon, 15 Oct 2018 07:32:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年10月15日 14:31, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> V2:
> * set consistent staging dirs for all images

Missing Richard's comment, please ignore this patch.

--Kai

>
>
> The following changes since commit b02f3bfe2fee291a9db85094e5f31b1933acf871:
>
>    local.conf.sample.extended: add another warning to comment about GLIBC_GENERATE_LOCALES (2018-10-14 23:45:40 +0100)
>
> are available in the Git repository at:
>
>    git://git.pokylinux.org/poky-contrib kangkai/image
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/image
>
> Kai Kang (1):
>    image.bbclass: set consistent staging dirs
>
>   meta/classes/image.bbclass | 5 +++++
>   1 file changed, 5 insertions(+)
>

-- 
Regards,
Neil | Kai Kang


