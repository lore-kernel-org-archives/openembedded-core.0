Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5F1B36010B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 14:29:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Oct 2017 07:29:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,366,1503385200"; d="scan'208";a="1181282243"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 12 Oct 2017 07:29:56 -0700
To: Ming Liu <liu.ming50@gmail.com>
References: <1506920927-1938-1-git-send-email-liu.ming50@gmail.com>
	<e2c0777f-af1f-d7d9-ebe3-816f4d6059a2@linux.intel.com>
	<CALatG=4EguhkFgC-cSJ4tgrLDUtog1FMJN8NAr6WQG2qKmogLw@mail.gmail.com>
	<CALatG=7JP1nj6PSwth+5ZvAigVp4iY1o64b3NoWoT80vNgrz2Q@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <2f1aee95-739d-efb8-c598-ac75a2e66496@linux.intel.com>
Date: Thu, 12 Oct 2017 17:26:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CALatG=7JP1nj6PSwth+5ZvAigVp4iY1o64b3NoWoT80vNgrz2Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsolv: fix a kernel-devsrc installation issue
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
X-List-Received-Date: Thu, 12 Oct 2017 14:29:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/12/2017 05:25 PM, Ming Liu wrote:
> Ping, this patch had been merged to libsolv upstream.

You can now backport the patch, or wait for the upstream to release a 
new version.

Alex

