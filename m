Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 020AD6069C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 10:33:41 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Oct 2017 03:33:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,422,1503385200"; d="scan'208";a="163738791"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 23 Oct 2017 03:33:41 -0700
To: Li Zhou <li.zhou@windriver.com>, openembedded-core@lists.openembedded.org
References: <1508744693-248151-1-git-send-email-li.zhou@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <f4cc1dae-2111-1d0f-9b39-01e77acb6583@linux.intel.com>
Date: Mon, 23 Oct 2017 13:29:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1508744693-248151-1-git-send-email-li.zhou@windriver.com>
Subject: Re: [PATCH] curl: Security Advisory - curl - CVE-2017-1000254
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
X-List-Received-Date: Mon, 23 Oct 2017 10:33:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/23/2017 10:44 AM, Li Zhou wrote:
> Porting patch from <https://github.com/curl/curl/commit/
> 5ff2c5ff25750aba1a8f64fbcad8e5b891512584> to solve CVE-2017-1000254.

It's better to update to latest version (7.56) instead of backporting 
patches, please do that.

Alex

