Received: from mail-wg0-f54.google.com ([74.125.82.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UAltd-0002zk-J1
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 19:38:29 +0100
Received: by mail-wg0-f54.google.com with SMTP id fm10so744982wgb.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 10:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=zm05ocjL/md6zUJ8iRZJoeR8f/Ai/0hHUHXiOyBlTHs=;
	b=Uqd0xZ6x0qM3yP+oCwGj7xmBo0qTZk1+MeUOvZ5MKnouqAGvSSd4JLWbH1kH24kS5J
	2i/C3iPAKXeeJlguEsjkA79TC/NgROjOOhLxKlk99/qry4wRgSBj+iWmeWoGlT3ir70W
	GuccS3py1ndDqvcftnNJZRFgesFXjFdGG9Y4CvCuzeEXVOveZ2m+bGr4QoXUqsvgjJXo
	Avr2b/xGNcrde7WYtzDoUoBuBtbczy9yKfwySlMkJGuQZc/e5ymOkzNFi66R9sIwKvuT
	UfodoP5t3O0XlhKhwj1atV4CAKdMklc7Dm5/Rp4Gi62ShrfsvXj2zke1/zSdeoV3Khcu
	Oyrw==
MIME-Version: 1.0
X-Received: by 10.180.77.9 with SMTP id o9mr28361863wiw.16.1361989328940; Wed,
	27 Feb 2013 10:22:08 -0800 (PST)
Received: by 10.194.45.100 with HTTP; Wed, 27 Feb 2013 10:22:08 -0800 (PST)
In-Reply-To: <1361988753.1704.4.camel@empanada>
References: <cover.1361976853.git.tom.zanussi@linux.intel.com>
	<CAHUNapSHx-HAK86oQQWG9hYwa_zV11ccqs-i5GxUA+ztjvBNAA@mail.gmail.com>
	<1361988753.1704.4.camel@empanada>
Date: Wed, 27 Feb 2013 13:22:08 -0500
Message-ID: <CAHUNapQWWDwJUrzWS_t9inrzhbU5nwVi6y2zY0V5Cb_=XSED4Q@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] add libaudit and enable 'perf trace'
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
X-List-Received-Date: Wed, 27 Feb 2013 18:38:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 27, 2013 at 1:12 PM, Tom Zanussi
<tom.zanussi@linux.intel.com> wrote:
> Which image are you building?  I'm guessing core-image-minimal?

Yes.


