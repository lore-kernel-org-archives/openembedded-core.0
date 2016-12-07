Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B106860806
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 12:22:18 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP; 07 Dec 2016 04:22:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,310,1477983600"; d="scan'208";a="37872105"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 07 Dec 2016 04:22:19 -0800
To: openembedded-core@lists.openembedded.org
References: <1481097673-8896-1-git-send-email-mingli.yu@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <8b8e7b83-3cca-7615-8aef-bbfdc0d9edb5@linux.intel.com>
Date: Wed, 7 Dec 2016 14:22:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1481097673-8896-1-git-send-email-mingli.yu@windriver.com>
Subject: Re: tiff: fix several tiff CVE issues
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
X-List-Received-Date: Wed, 07 Dec 2016 12:22:19 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/07/2016 10:01 AM, mingli.yu@windriver.com wrote:
> These commits fix several tiff CVE issues:
> CVE-2016-9533, CVE-2016-9534, CVE-2016-9535,
> CVE-2016-9536, CVE-2016-9537 and CVE-2016-9538

Please update tiff to latest upstream version (see 
http://packages.yoctoproject.org/), and then apply any CVE fixes which 
are still necessary.

This applies to any other package as well.

Alex


