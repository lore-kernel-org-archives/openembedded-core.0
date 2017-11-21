Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 000F678876
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 15:56:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2017 07:56:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,432,1505804400"; 
   d="scan'208";a="7861334"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 21 Nov 2017 07:56:13 -0800
To: "Burton, Ross" <ross.burton@intel.com>, Armin Kuster <akuster808@gmail.com>
References: <cover.1511222485.git.akuster@mvista.com>
	<fb0a858be004dd7f7be4be564d85ebc088fdf104.1511222485.git.akuster@mvista.com>
	<CAJTo0LZOr7EXUkH7J+_QSZzoKFOpobrExieEcAsNTQXNz0aXEA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <58bea898-a1b0-3459-34b4-5e41490bdfd8@linux.intel.com>
Date: Tue, 21 Nov 2017 17:56:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZOr7EXUkH7J+_QSZzoKFOpobrExieEcAsNTQXNz0aXEA@mail.gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] libassuan: update to 2.4.4
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
X-List-Received-Date: Tue, 21 Nov 2017 15:56:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/21/2017 04:41 PM, Burton, Ross wrote:
> License checksum changes but no explanation.

Should we introduce a standard tag for the explanation, similar to cve tags?

License-checksum-change: copyright years updated

and then have the robot do the check, while we can spend time on more 
interesting things.


Alex

