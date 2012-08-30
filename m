Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T78YJ-00055P-OU
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 19:29:11 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 30 Aug 2012 10:16:55 -0700
Received: by obblz20 with SMTP id lz20so3849617obb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 10:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=GPgXjsB1g5CAoL7+o36O09++EiOrU7CmYQBhUi7dRQs=;
	b=j9C8zQWzHEgyngAvBEdIPXOQnjbrG8xc2plBkctR0geONy85slOOJvwk93hXtXDr41
	7TE95+TV2uFimx4HWl6VeEtrqagF5h9bUM4Ys3QTLFwYKQWAW5SPesGjc8RtiOpRs5Wc
	moNw0S84jMj4q1UmIz2OlIJCTMlpbmihcnlgbyizLMDXGdT8PdbOLUGEnx3XoSRjdODP
	zU7hVOe4eCG3ZuS5gqEVWZPYDbzfguoYW0JO6gkhlj9HogRUGfSiHNgWXNbU9mRtKuu6
	Nj1sV3bbFXwHq/rdwzGTAcoBHwnKtck46GCgHoaCiovvKd5ANdpXzoQnnauaJZKVySl6
	ywXw==
Received: by 10.182.124.102 with SMTP id mh6mr5352390obb.48.1346347014785;
	Thu, 30 Aug 2012 10:16:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Thu, 30 Aug 2012 10:16:34 -0700 (PDT)
In-Reply-To: <503F9F23.1070600@linux.intel.com>
References: <cover.1346346320.git.ross.burton@intel.com>
	<503F9F23.1070600@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Aug 2012 18:16:34 +0100
Message-ID: <CAJTo0LZzwkYmDxBP55rw=uEiOzG8Vye6erWXNC67DhQ6Qm_pQQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQmVJwLiFhJy6gwtUeOsoZFIKBBxA4BLAd3IfWv+UV7WFe6Mak1jiNKk3Vsj52KsrbqqZLT2
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] Remove xserver-kdrive
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2012 17:29:12 -0000
Content-Type: text/plain; charset=UTF-8

On 30 August 2012 18:13, Saul Wold <sgw@linux.intel.com> wrote:
> You seem to be missing Signed-off-by: in the repo itself, but they all
> appear in the email!

Fixed.

Ross


