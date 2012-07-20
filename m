Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Ss9gm-0002A2-9m
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 11:40:00 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 20 Jul 2012 02:28:35 -0700
Received: by pbbro8 with SMTP id ro8so6152850pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 02:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=Xy1SIDxvJcp3pM+kQ6ecQ1g656O7aAkpxiHCO/dYSUQ=;
	b=Zf8oSmZzyXUa6y/UrYKcbe6+vmYBkx5q3WhcYu6dPCbCfoui2wjSnw8oKmJvZWntOR
	BjZeEchymdaIun6VVzR2+eurZ9RnnMCcgZi7GZiiH9gO9wKkty7ZgjhZIe545Jt8t+5B
	apYllqxd1s0CW8230iU9FBOwCDxH0MD9YYSDReibfC/yDtLxQztgptg3TEQlKAQBBGMM
	t0T+irwvHCp0y8vP2pMsl6EEblZibCfbbdWO8Gkyhej44GZwsj79P7aTv7rdtfCIEziC
	/tDOWergB2WS8V/Rd4eq4SaSBdq8r71CWmlCEeVzKh8DlkZCVhYDvf147uiOorOIM4Oy
	sZ8g==
Received: by 10.68.220.104 with SMTP id pv8mr12188462pbc.119.1342776515577;
	Fri, 20 Jul 2012 02:28:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.142.153.5 with HTTP; Fri, 20 Jul 2012 02:28:15 -0700 (PDT)
In-Reply-To: <7D478CDEE69A4F1CA7485BD18027A79D@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
	<5008E1C8.9030501@linux.intel.com>
	<7D478CDEE69A4F1CA7485BD18027A79D@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 20 Jul 2012 10:28:15 +0100
Message-ID: <CAJTo0LasaEuCSDQnBTfVcO59GFi+mtx5y9duHgAG8iJ8F0qJ4g@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQmc89fhN8RKE+o6AukRnUymckG/Y5eD9zWHVMdrEqPV2Inv4zdO5aFJoRK7Qq8oaaEEj+29
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/26] Use gtk-doc-stub
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
X-List-Received-Date: Fri, 20 Jul 2012 09:40:00 -0000
Content-Type: text/plain; charset=UTF-8

On 20 July 2012 08:03, Ross Burton <ross.burton@intel.com> wrote:
> On Friday, 20 July 2012 at 05:42, Saul Wold wrote:
>> While you have SOB's in the email, the branch itself does not have any
>> SOBs which is where I was pulling from.
>
> That's a very good point.  I'll SOB it and repush shortly.

Signed-off and re-pushed.

Ross


