Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 36AF379F46
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 06:48:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA26m4LB027762
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Nov 2018 23:48:35 -0700
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 1 Nov 2018 23:48:20 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1541138869-68039-1-git-send-email-changqing.li@windriver.com>
	<20181102064101.13840.12812@do.openembedded.org>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <f8c4a061-f2d2-9c04-1885-647f98a222ea@windriver.com>
Date: Fri, 2 Nov 2018 14:48:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181102064101.13840.12812@do.openembedded.org>
X-Originating-IP: [128.224.162.228]
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGN1cmw6IGZpeCBmb3IgQ1ZFLTIwMTgtMTY4MzkvQ1ZFLTIwMTgtMTY4NDAvQ1ZFLTIwMTgtMTY4NDI=?=
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
X-List-Received-Date: Fri, 02 Nov 2018 06:48:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

I have add CVE tag in the patch file,   is this test result incorrect?

On 11/2/18 2:41 PM, Patchwork wrote:
> == Series Details ==
>
> Series: curl: fix for CVE-2018-16839/CVE-2018-16840/CVE-2018-16842
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/14764/
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
> * Patch            curl: fix for CVE-2018-16839/CVE-2018-16840/CVE-2018-16842
>   Issue             Missing or incorrectly formatted CVE tag in included patch file [test_cve_tag_format]
>    Suggested fix    Correct or include the CVE tag on cve patch with format: "CVE: CVE-YYYY-XXXX"
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
-- 
BRs

Sandy(Li Changqing)


