Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TiXGP-0008MZ-BY
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 22:21:19 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 11 Dec 2012 13:06:42 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so21576627oag.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2012 13:06:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=qpwOvrNxbNNX8FST3okpwKyqOlK4U5ryopDl+PRCrTw=;
	b=nEtEtP5vEQ3LzIotVNhSFBpOKP2IsVdrOacuvPH0fLTTOnaF0xt6TPAujyA9sGznAC
	T6tbPX6CgZlWenebW3ggWiVgziOpn2FItIo4xpt+QQwXTxbyt1aTsggIAM3ojXDbPfWR
	wxMY2RZWwLP7L71rI7BKojwTKoNwNGYkTcRZ77MorXjb6dznXxMkUc6fKO0oK3qunlX7
	NeGVXfVJ203JQa24VtTgVbnxUDsjaaQjOjO0QezxQ5zzkSs4g79Zd4acjDggn2EjdNWF
	SdczJx5qy2u/NoUuqW04yk7/oaCnvuwJcpX0ldud23FdxkvGTKc0z63EfSsT6HNfSdik
	rnLg==
Received: by 10.60.170.10 with SMTP id ai10mr10416329oec.72.1355260001531;
	Tue, 11 Dec 2012 13:06:41 -0800 (PST)
Received: by 10.60.170.10 with SMTP id ai10mr10416327oec.72.1355260001468;
	Tue, 11 Dec 2012 13:06:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Tue, 11 Dec 2012 13:06:21 -0800 (PST)
In-Reply-To: <e2c8ebaeba87f13c6e0e55a825bd397f36239b34.1355214185.git.alexandru.damian@intel.com>
References: <cover.1355214185.git.alexandru.damian@intel.com>
	<e2c8ebaeba87f13c6e0e55a825bd397f36239b34.1355214185.git.alexandru.damian@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Dec 2012 21:06:21 +0000
Message-ID: <CAJTo0LYwtu9Z4ZNhqHzM=-VZ+h4LTh5mK7ziUV9dOrVUVcEEEg@mail.gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQkWzhtCyi4d+an5YyjmIN30RHEM5cN71VfhkrwSO0jITdGAtEzfdpVtHMENB8Y4XLCC34Xtlu0lzKtjoLljtECHwuhOk05YPWA24e/3NYRlDSMezau1D11rDsOexvGA3cUSpK6FXxvVYaE1S+/hPQsgRhk1Tclk+btVKT/rCHhvsEg/XyArNSjXWhNS4hfccIOrbvO6
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/8] mesa-dri: upgrade -git version to current master
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
X-List-Received-Date: Tue, 11 Dec 2012 21:21:19 -0000
Content-Type: text/plain; charset=UTF-8

On 11 December 2012 08:29, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> From: Ross Burton <ross.burton@intel.com>

Again this is in m-u-t and the latest consolidated pull, so expect to
rebase soon and see this disappear.

Ross


