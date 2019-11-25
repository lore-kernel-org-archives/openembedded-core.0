Return-Path: <ross.burton@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E9FA57F946
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 13:55:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Nov 2019 05:55:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,241,1571727600"; d="scan'208";a="260405479"
Received: from xsanroma-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.249.34.24])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Nov 2019 05:55:29 -0800
To: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
References: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
	<b3ae667e644cf4b81c096562965268dbe5596065.camel@linuxfoundation.org>
	<531618732.621500.1574366028835.JavaMail.zimbra@savoirfairelinux.com>
	<50236bca804ff079db05b696f783c9af7e408c8f.camel@linuxfoundation.org>
	<2010614174.635763.1574420884655.JavaMail.zimbra@savoirfairelinux.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <f12cb0c9-04ab-f695-dcaa-de162f7f1672@intel.com>
Date: Mon, 25 Nov 2019 13:55:29 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <2010614174.635763.1574420884655.JavaMail.zimbra@savoirfairelinux.com>
Cc: paul eggleton <paul.eggleton@linux.intel.com>, bunk <bunk@stusta.de>,
	Savoir-faire Linux Rennes <rennes@savoirfairelinux.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 00/17] NPM refactoring
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
X-List-Received-Date: Mon, 25 Nov 2019 13:55:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 22/11/2019 11:08, Jean-Marie LEMETAYER wrote:
> I based my work on the current implementation, but I never thought of
> refactoring as much. I have however some concerns about the management
> of the registry and the development dependencies. I will try to come
> back with a v4.

There's a lot of NPM patches flying around now: are any of the patches 
in this 17-long series able to be merged ahead of a full refactor?

Ross

