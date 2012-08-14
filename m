Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T1IuN-0007Oc-1g
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 17:19:51 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 14 Aug 2012 08:07:55 -0700
Received: by obceq6 with SMTP id eq6so580470obc.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2012 08:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=agSQxAGCfRsr4SrVxQuDDNDgKc/A0FEQbXoOdoa4PX8=;
	b=SUcKjIk4qfBEw4R/tL1F58imdq2fQIhe0AzAMD/bt/l2Mtwu+qEEvqXvq7F1BU0X3Y
	Xz3VW+9yLpslv5nDFhGD4uilJhmLtckfASZG30vdybxcg0rG3m4TrqIGKg9+jCH24ft0
	BXWMDdWlMzyQKtnaWV5fGIA+bfk94RVizsvI4FIWYqBDnKYMNxdSz7bZTs8Xa5bGEEaO
	iNshLBzq0vmZBucf6u9w9xLF/PGr2bg8mdtNiyqG3Mu3/osYG7vWkJG8Kp7JOKffFjCP
	M3guTD5UFeXDPGJKlSTcDInmvmrCAYIn5jmpCrmajsQ5ICjOBE+yRYgdKNbnpMUqhi0t
	uIjA==
Received: by 10.182.131.98 with SMTP id ol2mr19372396obb.69.1344956874094;
	Tue, 14 Aug 2012 08:07:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Tue, 14 Aug 2012 08:07:32 -0700 (PDT)
In-Reply-To: <CAEsOVNcOGbaQghWhP5VBMMPc2TFSEoh37QaNyPbpOxH+TGDc7w@mail.gmail.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
	<76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
	<ccea2d07d0f88da1d5df027147238a97f78a4d3a.1344946189.git.sgw@linux.intel.com>
	<CAEsOVNcOGbaQghWhP5VBMMPc2TFSEoh37QaNyPbpOxH+TGDc7w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Aug 2012 16:07:32 +0100
Message-ID: <CAJTo0LZdvTw7FWbMLgE8LC3ojtGyJ8kUzZ3coAFEh3JC7gUUpQ@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkg0DqtXwE6EQBRUHZXvZZnDtWMQTKX0/wuFkpBbbJ2dMC6eptXDkjutm+Wmh2Nf/1OsxuT
Subject: Re: [CONSOLIDATED REQUEST 46/64] owl-video_git.bb: fix compilation on Fedora 13 machine
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
X-List-Received-Date: Tue, 14 Aug 2012 15:19:51 -0000
Content-Type: text/plain; charset=UTF-8

On 14 August 2012 15:48, McClintock Matthew-B29882 <B29882@freescale.com> wrote:
> I think we decided to wait / ignore this one.

Yes, unless this crops up again this can be dropped.

Ross


