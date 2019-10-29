Return-Path: <ross.burton@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DCFB77FAB9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 12:34:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Oct 2019 05:34:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; d="scan'208";a="399770558"
Received: from koernerm-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.41.216])
	by fmsmga005.fm.intel.com with ESMTP; 29 Oct 2019 05:34:52 -0700
To: Zhixiong Chi <zhixiong.chi@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20191029031229.57387-1-zhixiong.chi@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <73a1f7af-d125-9f07-a8ab-422b320ca66e@intel.com>
Date: Tue, 29 Oct 2019 12:34:51 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191029031229.57387-1-zhixiong.chi@windriver.com>
Subject: Re: [PATCH v2] binutils: CVE-2019-17450 and CVE-2019-17451
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
X-List-Received-Date: Tue, 29 Oct 2019 12:34:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 29/10/2019 03:12, Zhixiong Chi wrote:
> This patch fix the stack overflow issue for recursive call
> and the segment fault issue.

Trevor has already posted these patches.

Ross


