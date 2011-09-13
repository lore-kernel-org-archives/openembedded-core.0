Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R3Y5L-0004f1-3M
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 20:51:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Sep 2011 11:46:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,375,1312182000"; d="scan'208";a="50868031"
Received: from unknown (HELO [10.255.14.228]) ([10.255.14.228])
	by fmsmga001.fm.intel.com with ESMTP; 13 Sep 2011 11:46:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Sep 2011 11:46:41 -0700
In-Reply-To: <CAP9ODKrSgJqnrAmdDiaPtXYGRL-_8JQ7OUZcx92_hJFA-nCjng@mail.gmail.com>
References: <1314804932.19905.169.camel@phil-desktop>
	<4E6A82F8.5020508@linux.intel.com> <1315643085.1986.24.camel@ted>
	<1315646891.4368.13.camel@lenovo.internal.reciva.com>
	<1315648440.1986.27.camel@ted>
	<1315655628.4368.14.camel@lenovo.internal.reciva.com>
	<1315933706.13526.11.camel@ted>
	<1315934738.2519.126.camel@phil-desktop>
	<CAP9ODKrSgJqnrAmdDiaPtXYGRL-_8JQ7OUZcx92_hJFA-nCjng@mail.gmail.com>
Organization: Yocto Project / OTC / Intel
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1315939601.1058.5.camel@swold-mobl.bigsur.com>
Mime-Version: 1.0
Subject: Re: [PATCH] pango: use qemu to generate pango.modules during rootfs construction
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: sgw@linux.intel.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Sep 2011 18:51:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-13 at 15:33 -0300, Otavio Salvador wrote:
> On Tue, Sep 13, 2011 at 14:25, Phil Blundell <philb@gnu.org> wrote:
> > Do you know how long it's likely to be before this release is complete
> > and the tree is re-opened for development?  I'm a bit unclear what the
> > process is for that.
> 
> Maybe we ought to use a 'next' branch for it?
> 
I believe the plan is to branch in the next day or so for an RC2 and
then master will open up for development again.  I will be pulling
together both RC2 pull requests (very limited point fixes) and look at
consolidated pulls for master.

Sau!




