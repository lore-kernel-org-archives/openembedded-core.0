Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 97B5A65ED7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 07:31:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5O7VwbU024930
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 00:31:58 -0700 (PDT)
Received: from [128.224.162.182] (128.224.162.182) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Tue, 24 Jun 2014 00:31:58 -0700
Message-ID: <53A92964.5040202@windriver.com>
Date: Tue, 24 Jun 2014 15:31:48 +0800
From: Wenlin Kang <wenlin.kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1402295373-27606-1-git-send-email-wenlin.kang@windriver.com>
In-Reply-To: <1402295373-27606-1-git-send-email-wenlin.kang@windriver.com>
X-Originating-IP: [128.224.162.182]
Subject: Re: [PATCH V2] bash: fix to build bash/po/ correctly
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
X-List-Received-Date: Tue, 24 Jun 2014 07:32:03 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年06月09日 14:29, Wenlin Kang wrote:
> Changes from V1:
> 1. add Signed-off-by: tag
> 2. remake the patch, make it can apply correctly
>
> Wenlin Kang (1):
>    bash: fix to build bash/po/ correctly
>
>   .../bash/bash/fix-to-build-po-correctly.patch      |   87 ++++++++++++++++++++
>   meta/recipes-extended/bash/bash_4.3.bb             |    1 +
>   2 files changed, 88 insertions(+)
>   create mode 100644 meta/recipes-extended/bash/bash/fix-to-build-po-correctly.patch
>

ping

// Wenlin

-- 
Thanks,
Wenlin Kang


