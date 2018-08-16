Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 266CA79263
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 06:52:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7G6qr7A008654
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 23:52:53 -0700 (PDT)
Received: from localhost.corp.ad.wrs.com (128.224.162.161) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 15 Aug 2018 23:52:51 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1534400247.git.liezhi.yang@windriver.com>
	<20180816063755.13840.99629@do.openembedded.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <7a31cb61-ee88-d8c9-fce3-f0b7bd854202@windriver.com>
Date: Thu, 16 Aug 2018 14:56:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180816063755.13840.99629@do.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHByZWxpbms6IGZpeGVkIHNlZ21lbnRhdGlvbiBmYXVsdCB3aGVuIGluc3RhbGwgbGlicWI=?=
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
X-List-Received-Date: Thu, 16 Aug 2018 06:52:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 08/16/2018 02:37 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: prelink: fixed segmentation fault when install libqb
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/13549/
> State : failure
> 
> == Summary ==
> 
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
> 
> 
> 
> * Issue             Upstream-Status is Submitted, but it is not mentioned where [test_upstream_status_presence_format]
>    Suggested fix    Include where 0001-src-dso.c-use-ehdr.e_shstrndx-as-index.patch was submitted
>    Current          Upstream-Status: Submitted
>    Standard format  Upstream-Status: Submitted [where]

Fixed in the repo:

Upstream-Status: Submitted 
[https://lists.yoctoproject.org/pipermail/yocto/2018-August/042240.html]
Upstream-Status: Submitted 
[https://sourceware.org/ml/elfutils-devel/2018-q3/msg00065.html]

// Robert

> 
> 
> 
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
> 
> ---
> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> 
> 

