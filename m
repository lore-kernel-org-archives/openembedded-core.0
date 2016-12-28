Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 531DE6FFD8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2016 02:56:32 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 27 Dec 2016 18:56:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,420,1477983600"; d="scan'208";a="916708360"
Received: from ranerica-desktop.sc.intel.com (HELO [10.3.52.169])
	([10.3.52.169])
	by orsmga003.jf.intel.com with ESMTP; 27 Dec 2016 18:56:33 -0800
Message-ID: <1482893793.106950.42.camel@ranerica-desktop>
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Date: Tue, 27 Dec 2016 18:56:33 -0800
In-Reply-To: <CAGNsrLAhdfQ7KGvBGCtSype2niB7AvqXGtWqFYOVd7e2GqvJfg@mail.gmail.com>
References: <cover.1482324587.git.patrick.ohly@intel.com>
	<CAGNsrLAhdfQ7KGvBGCtSype2niB7AvqXGtWqFYOVd7e2GqvJfg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] UEFI + Secure Boot + qemu
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
X-List-Received-Date: Wed, 28 Dec 2016 02:56:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-12-21 at 16:19 +0200, Fathi Boudra wrote:
> 
> fwiw, I've been maintaining acpica recipe in meta-oe, and will keep an
> eye here as well.
> meta-luv supports both x86* and arm*, and we have an interest in
> having the same features available and working for qemuaarch64.

I was not aware of this. Perhaps there is no need for us to maintain a
separate recipe in meta-luv.


