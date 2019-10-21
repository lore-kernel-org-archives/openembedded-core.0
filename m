Return-Path: <ross.burton@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 630087F35C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 10:51:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Oct 2019 03:51:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,323,1566889200"; d="scan'208";a="398622443"
Received: from adahiya-mobl1.gar.corp.intel.com (HELO blackadder.local)
	([10.249.39.45])
	by fmsmga006.fm.intel.com with ESMTP; 21 Oct 2019 03:51:53 -0700
To: openembedded-core@lists.openembedded.org
References: <1571629432-154768-1-git-send-email-changqing.li@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <d07ab5be-163d-42bc-15f7-b4038afc6c8e@intel.com>
Date: Mon, 21 Oct 2019 11:51:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1571629432-154768-1-git-send-email-changqing.li@windriver.com>
Subject: Re: [PATCH] e2fsprogs: fix CVE-2019-5094
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
X-List-Received-Date: Mon, 21 Oct 2019 10:51:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

There is an upgrade queued for master, so this is zeus-specific.

Ross

