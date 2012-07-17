Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sr4On-0004YC-Cd
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 11:48:58 +0200
Received: from mail-qa0-f45.google.com ([209.85.216.45])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 17 Jul 2012 02:37:36 -0700
Received: by qaeb19 with SMTP id b19so2021722qae.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 02:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=NA/jDpiPtIUJaxgVnt/gb9tAbJ8jUGiHn4oAKeYQSHg=;
	b=ByLK2BQECOeTaD1dbncL7dcS7AfEiavzYvgkEr5kzFEbqNt/0UUmGV4kwYOdIwG5Am
	c9aClWLuPN4jQDOwNXbn9r1KQujfFTkkwFitHMdgiZwpsMO9JwOaFttKMtXnURA6gk5O
	UPEGGzWVwgO+Y87PfmONRdiyA0g0ho/JlhYkqit1SIzf7HeUlg5zui4HWTna3uwtD3nN
	AK1sN6Fs2LZP2+x/yG77EHjl3Pq8G1AfToFbIickV+YbMVGaZnhbxUlnikF4fWokdqwm
	v/rjFmSHXYjBnuH7JZu2ZQL5yD0/F2m6QExBUJfh8Q4SEd7cjpe+4VwPYsu20jsxYb8p
	MR2g==
Received: by 10.224.177.1 with SMTP id bg1mr3133443qab.68.1342517855265; Tue,
	17 Jul 2012 02:37:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.82.74 with HTTP; Tue, 17 Jul 2012 02:37:14 -0700 (PDT)
In-Reply-To: <cover.1342505369.git.sgw@linux.intel.com>
References: <cover.1342505369.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Jul 2012 10:37:14 +0100
Message-ID: <CAJTo0LZsPrQWb+M2sdQdBzez-igd8Sb1H-wRFosmxZZz9vT+Rg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQn+dlhoNT2NPprLe/ghC3+fC1EQOw0/cBKhyV9GBJWUJgi/No1VhSOnYfpLo8DcHFhQvYRS
Subject: Re: [CONSOLIDATED PULL 00/45] Eglic, Automake (cover letter Only)
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
X-List-Received-Date: Tue, 17 Jul 2012 09:48:59 -0000
Content-Type: text/plain; charset=UTF-8

Richard,

On 17 July 2012 07:14, Saul Wold <sgw@linux.intel.com> wrote:
> I have continued to wokr on this get of changes from Khem and Nitin
> and Ross.

My two webkit commits are unrelated to the automake/eglibc changes and
I'm just test-building some further revisions now, so feel free to
leave those out for now.

Ross


