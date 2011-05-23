Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QOTtj-0007m3-8x for openembedded-core@lists.openembedded.org;
	Mon, 23 May 2011 14:06:11 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QOTqr-0001fQ-BW
	for openembedded-core@lists.openembedded.org;
	Mon, 23 May 2011 14:03:13 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <25cb5d89f245bcfdc7f0654ba7025e1e1a24bc64.1306002889.git.sgw@linux.intel.com>
References: <cover.1306002889.git.sgw@linux.intel.com>
	<25cb5d89f245bcfdc7f0654ba7025e1e1a24bc64.1306002889.git.sgw@linux.intel.com>
Organization: Phil Blundell Consulting Ltd
Date: Mon, 23 May 2011 13:03:12 +0100
Message-ID: <1306152192.2525.73.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 3/8] puzzles: update to r9173
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 23 May 2011 12:06:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-05-21 at 11:37 -0700, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../puzzles/{puzzles_r9163.bb => puzzles_r9173.bb} |    0
>  1 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta/recipes-sato/puzzles/{puzzles_r9163.bb => puzzles_r9173.bb} (100%)

No doubt the patch is fine, but why is this recipe in oe-core at all?
It doesn't seem to fit any reasonable definition of "core" functionality
that I can immediately think of.

p.




