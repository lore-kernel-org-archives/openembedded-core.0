Return-Path: <ross.burton@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 2B72C7FCEF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 12:32:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Dec 2019 04:32:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; d="scan'208";a="215200444"
Received: from pozo-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.252.33.212])
	by orsmga003.jf.intel.com with ESMTP; 09 Dec 2019 04:32:16 -0800
To: openembedded-core@lists.openembedded.org
References: <20191120060346.3867-1-zangrc.fnst@cn.fujitsu.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <339a5add-791b-dc04-4115-ee3f88bbb132@intel.com>
Date: Mon, 9 Dec 2019 12:32:15 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191120060346.3867-1-zangrc.fnst@cn.fujitsu.com>
Subject: Re: [PATCH] alsa-utils:upgrade 1.1.9 -> 1.2.1
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
X-List-Received-Date: Mon, 09 Dec 2019 12:32:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

ERROR: ParseError at 
/home/ross/Yocto/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.9.bb:1: 
Could not include required file alsa-utils_1.1.9.bb

Please actually test your patches.

Ross

