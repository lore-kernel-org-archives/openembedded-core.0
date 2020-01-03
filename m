Return-Path: <ross.burton@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3C3DB7FA2E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2020 16:05:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jan 2020 08:05:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,391,1571727600"; d="scan'208";a="214501461"
Received: from hongy-mobl1.ger.corp.intel.com (HELO rburton-mac01.local)
	([10.252.50.70])
	by orsmga008.jf.intel.com with ESMTP; 03 Jan 2020 08:05:43 -0800
To: Wang Mingyu <wangmy@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
References: <1578031578-88217-1-git-send-email-wangmy@cn.fujitsu.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <260375d0-ef07-a502-0215-014dcbf975c6@intel.com>
Date: Fri, 3 Jan 2020 16:05:42 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1578031578-88217-1-git-send-email-wangmy@cn.fujitsu.com>
Subject: Re: [PATCH] glib-2.0: upgrade 2.62.3 -> 2.62.4
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
X-List-Received-Date: Fri, 03 Jan 2020 16:05:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Using a patch I have locally to add more warnings to the log checker:

WARNING: glib-2.0-1_2.62.4-r0 do_configure: Meson cross property 
have_proc_self_cmdline defaulting to False

Can you seed that correctly please.

Ross

