Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BC96371DDD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 16:10:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v9BGARKd002654
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 09:10:27 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 11 Oct 2017 09:10:26 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
	<64c82ed6adc9a0d3b36122ac793ef1792151f916.1507735448.git.alexander.kanavin@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <a9aab24e-629c-3126-048e-e96fb5081ea4@windriver.com>
Date: Wed, 11 Oct 2017 11:10:26 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <64c82ed6adc9a0d3b36122ac793ef1792151f916.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 49/50] maintainers.inc: add Mark Hatle for libmnl
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
X-List-Received-Date: Wed, 11 Oct 2017 16:10:26 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/11/17 10:34 AM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/conf/distro/include/maintainers.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index cc857e0a01e..3f1d86422fb 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -358,6 +358,7 @@ RECIPE_MAINTAINER_pn-libinput = "Jussi Kukkonen <jussi.kukkonen@intel.com>"
>  RECIPE_MAINTAINER_pn-libjson = "Alexander Kanavin <alexander.kanavin@intel.com>"
>  RECIPE_MAINTAINER_pn-libksba = "Alexander Kanavin <alexander.kanavin@intel.com>"
>  RECIPE_MAINTAINER_pn-libmatchbox = "Jussi Kukkonen <jussi.kukkonen@intel.com>"
> +RECIPE_MAINTAINER_pn-libmnl = "Mark Hatle <mark.hatle@windriver.com>"
>  RECIPE_MAINTAINER_pn-libmpc = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER_pn-libnewt = "Hongxu Jia <hongxu.jia@windriver.com>"
>  RECIPE_MAINTAINER_pn-libnewt-python = "Hongxu Jia <hongxu.jia@windriver.com>"
> 

NAK.  I am not maintaining libmnl.

--Mark

