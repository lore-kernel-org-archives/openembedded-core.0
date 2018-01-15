Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 207BF78563
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 15:27:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Jan 2018 07:27:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,364,1511856000"; d="scan'208";a="195696326"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 15 Jan 2018 07:27:06 -0800
To: Mike Crowe <mac@mcrowe.com>, openembedded-core@lists.openembedded.org
References: <20180115152254.447-1-mac@mcrowe.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <a7be2ded-586e-b5a4-c2b1-62580356cbaa@linux.intel.com>
Date: Mon, 15 Jan 2018 17:27:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20180115152254.447-1-mac@mcrowe.com>
Subject: Re: [PATCH] rpm: backport configure fix for multiple users/groups with ID 0
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
X-List-Received-Date: Mon, 15 Jan 2018 15:27:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/15/2018 05:22 PM, Mike Crowe wrote:
> +Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/pull/377]

If this is merged by upstream, you should point to the commit. If you 
merely made a submission, then the status should say Submitted.

Alex

