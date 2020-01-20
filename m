Return-Path: <ross.burton@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 51EEA7F7BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 14:43:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jan 2020 06:43:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,342,1574150400"; d="scan'208";a="227067813"
Received: from grossi-mobl.ger.corp.intel.com (HELO rburton-mac01.local)
	([10.252.38.20])
	by orsmga003.jf.intel.com with ESMTP; 20 Jan 2020 06:43:05 -0800
To: Wang Mingyu <wangmy@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
References: <1579523214-47426-1-git-send-email-wangmy@cn.fujitsu.com>
	<1579523214-47426-11-git-send-email-wangmy@cn.fujitsu.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <6d90449e-71e3-de20-11f5-bad2dfae8d04@intel.com>
Date: Mon, 20 Jan 2020 14:43:04 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1579523214-47426-11-git-send-email-wangmy@cn.fujitsu.com>
Subject: Re: [PATCH] mesa: upgrade 19.3.1 -> 19.3.2
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
X-List-Received-Date: Mon, 20 Jan 2020 14:43:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

ERROR: ParseError at 
/home/rburton/Yocto/poky/meta/recipes-graphics/mesa/mesa-gl_19.3.1.bb:1: 
Could not include required file mesa_19.3.1.bb

Please remember to check bitbake parses after your patches.

Ross

