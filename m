Return-Path: <ross.burton@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 858C17F8BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 17:16:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Nov 2019 09:16:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,320,1569308400"; d="scan'208";a="236998326"
Received: from unknown (HELO blackadder.local) ([10.252.49.82])
	by fmsmga002.fm.intel.com with ESMTP; 18 Nov 2019 09:16:39 -0800
To: =?UTF-8?Q?Ernst_Sj=c3=b6strand?= <ernst.sjostrand@verisure.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <ea9c1aec639f2c505e8beb3faa7366ee7db4174a.camel@verisure.com>
	<6fedce54-e7dd-71bd-dd0d-96fc542664ce@intel.com>
	<AM0PR10MB20990993BB2A1B1EF84C7C8B944D0@AM0PR10MB2099.EURPRD10.PROD.OUTLOOK.COM>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <ae0d48cd-535e-d0de-b388-66605947cc91@intel.com>
Date: Mon, 18 Nov 2019 17:16:39 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <AM0PR10MB20990993BB2A1B1EF84C7C8B944D0@AM0PR10MB2099.EURPRD10.PROD.OUTLOOK.COM>
Subject: Re: [PATCH] do_image_cpio: Improve reproducibility
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
X-List-Received-Date: Mon, 18 Nov 2019 17:16:39 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 18/11/2019 15:19, Ernst Sjöstrand wrote:
> I see, it was created against the yocto/poky git. However I made sure it 
> applied to openembedded-core with "git am" also.
> If you use that it should work. I can create a new version if you want.

This was applying to poky... maybe your mailer mangled the whitespace.

Ross

